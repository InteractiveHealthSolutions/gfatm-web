package com.ihsinformatics.gfatmweb.server;
/* Copyright(C) 2016 Interactive Health Solutions, Pvt. Ltd.

 This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as
 published by the Free Software Foundation; either version 3 of the License (GPLv3), or any later version.
 This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program; if not, write to the Interactive Health Solutions, info@ihsinformatics.com
 You can also access the license on the internet at the address: http://www.gnu.org/licenses/gpl-3.0.html

 Interactive Health Solutions, hereby disclaims all copyright interest in this program written by the contributors.
 */

/**
 * 
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.PatternSyntaxException;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.ValidationException;

import org.hibernate.HibernateException;
import org.json.JSONException;
import org.json.JSONObject;

import com.ihsinformatics.gfatmweb.shared.RequestType;
import com.ihsinformatics.tbreachapi.core.service.impl.ServerService;
import com.ihsinformatics.tbreachapi.model.Definition;
import com.ihsinformatics.tbreachapi.model.DefinitionType;
import com.ihsinformatics.tbreachapi.model.Element;
import com.ihsinformatics.tbreachapi.model.Location;
import com.ihsinformatics.tbreachapi.model.LocationAttribute;
import com.ihsinformatics.tbreachapi.model.Privilege;
import com.ihsinformatics.tbreachapi.model.UserForm;
import com.ihsinformatics.tbreachapi.model.UserFormResult;
import com.ihsinformatics.tbreachapi.model.UserFormType;
import com.ihsinformatics.util.DateTimeUtil;

/**
 * @author babar.anis@ihsinformatics.com
 *
 */
public class AicWebService extends AbstractWebService {

	/**
	 * 
	 */
	private static final long serialVersionUID = -823823726983678814L;

	public AicWebService() {
	}

	/**
	 * Authenticates user via API
	 */
	@Override
	public boolean login(String username, String password) {
		return apiService.getAuthenticationService().authenticate(username,
				password);
	}

	/**
	 * Handles HTTP requests from client-side
	 * 
	 * @param request
	 * @param resp
	 * @throws IOException
	 * @throws JSONException
	 */
	@Override
	public void handleRequest(HttpServletRequest request,
			HttpServletResponse resp) throws IOException, JSONException {
		// InputStream input = null;
		PrintWriter out = resp.getWriter();
		JSONObject jsonResponse = new JSONObject();
		String response = null;
		String content = "";
		String responseDetail = "";
		Date dateEntered;
		Date endtime;
		Date starttime;
		long seconds = 0;
		setRequest(request);
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (request.getMethod().equalsIgnoreCase("GET")) {
			content = request.getQueryString();
			content = URLDecoder.decode(content, "UTF-8");
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			ServletInputStream inputStream = request.getInputStream();
			StringBuffer sb = new StringBuffer();
			int i;
			while ((i = inputStream.read()) != -1) {
				sb.append((char) i);
			}
			content = sb.toString();
		}
		content = content.replace("params=", "");
		JSONObject jsonObj = new JSONObject(content);
		if (!jsonObj.has("type")) {
			response = "ERROR";
			responseDetail = "Detail : form type not found";
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
			out.println(jsonResponse);
			out.flush();
			return;
		}
		String requestType = jsonObj.getString("type");
		String username = jsonObj.getString("username");
		if (username.equals("guest")) {
			jsonObj.remove("username");
			jsonObj.remove("password");
			jsonObj.put("username", guestUsername);
			jsonObj.put("password", guestPassword);
		}
		String[] fixedParameters = {"type", "username", "password", "location",
				"entereddate"};
		for (String param : fixedParameters) {
			if (!jsonObj.has(param)) {
				response = "ERROR";
				responseDetail = "Detail : Mandatory parameter(s) not found.";
				jsonResponse.put("response", response);
				jsonResponse.put("details", responseDetail);
				out.println(jsonResponse);
				out.flush();
				return;
			}
		}
		Map<String, Object> fixedParamsMap = new HashMap<String, Object>();
		for (String eachparam : fixedParameters) {
			fixedParamsMap.put(eachparam, jsonObj.getString(eachparam));
			jsonObj.remove(eachparam);
		}
		try {
			dateEntered = DateTimeUtil.fromSqlDateString(fixedParamsMap.get(
					"entereddate").toString());
		} catch (Exception e) {
			e.printStackTrace();
			response = "ERROR";
			responseDetail = "Detail: Parse exception for Date, Please provide valid format";
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
			out.println(jsonResponse);
			out.flush();
			return;
		}
		boolean login = apiService.login(fixedParamsMap.get("username")
				.toString(), fixedParamsMap.get("password").toString(),
				fixedParamsMap.get("location").toString());
		if (!login) {
			jsonResponse.put("response", "ERROR");
			jsonResponse
					.put("details",
							"Detail: Unable to authenticate, Please provide a valid username and password to login");
			out.println(jsonResponse);
			out.flush();
			return;
		}
		if (requestType.equals(RequestType.LOGIN)) {
			jsonResponse = doLogin(fixedParamsMap.get("username").toString(),
					fixedParamsMap.get("password").toString());
			HashMap<String, Integer> hashMap = getMetadata();
			jsonResponse.put("opd_size", hashMap.get("opd_size"));
			jsonResponse.put("opd_area_size", hashMap.get("opd_area_size"));
			jsonResponse.put("loc_size", hashMap.get("loc_size"));
		} else if (requestType.equals(RequestType.UVGI_GET_METADATA)) {
			jsonResponse = getUVGIMetadata();
		} else if (requestType.equals(RequestType.UVGI_GET_INSTALLATION_RECORD)) {
			jsonResponse = getUVGIInstallationRecord(jsonObj.getString("id"));
		} else if (requestType.equals(RequestType.UVGI_GET_TROUBLESHOOT_RECORD)) {
			jsonResponse = getUVGITroubleshootLog(jsonObj.getString("id"),
					jsonObj.getString("troubleshootId"));
		} else if (requestType
				.equals(RequestType.UVGI_GET_TROUBLESHOOT_STATUS_RECORD)) {
			jsonResponse = getUVGITroubleshootStatus(jsonObj.getString("id"),
					jsonObj.getString("troubleshootId"));
		} else {
			Map<String, Object> params = parseContent(jsonObj);

			try {
				if (params.containsKey("starttime")
						&& params.containsKey("endtime")) {
					starttime = DateTimeUtil.fromSqlDateTimeString(params.get(
							"starttime").toString());
					endtime = DateTimeUtil.fromSqlDateTimeString(params.get(
							"endtime").toString());
					seconds = (endtime.getTime() - starttime.getTime()) / 1000;
				}
			} catch (Exception e) {
				e.printStackTrace();
				response = "ERROR";
				responseDetail = "Detail: Parse exception for Date, Please provide valid format";
				jsonResponse.put("response", response);
				jsonResponse.put("details", responseDetail);
				out.println(jsonResponse);
				out.flush();
				return;
			}
			if (requestType.equals(RequestType.UVGI_INSTALLATION)) {

				if (getUserFormResultForUVGIInstallationByUVGIId(params.get(
						"ID").toString()) != null) {
					response = "ERROR";
					responseDetail = "Detail: UVGI Light with id:"
							+ params.get("ID").toString()
							+ " already exist in the system.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				jsonResponse = doUvgiInstallation(requestType, dateEntered,
						seconds, params);
			} else if (requestType.equals(RequestType.UVGI_MAINTENANCE)) {
				UserFormResult result = getUserFormResultForUVGIInstallationByUVGIId(params
						.get("ID").toString());
				if (result == null) {
					response = "ERROR";
					responseDetail = "Detail: No UVGI Light Record found for Id:"
							+ params.get("ID").toString() + " in the system.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				UserForm userForm = result.getUserForm();
				Date installationDate = userForm.getDateEntered();
				if (dateEntered.before(installationDate)) {
					response = "ERROR";
					responseDetail = "Detail: Invalid Form Date. Selected date is before the recorded installation date ("
							+ (installationDate.toString().split(" "))[0]
							+ ") of the light.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				jsonResponse = doUvgiMaintenance(requestType, dateEntered,
						seconds, params);
			} else if (requestType.equals(RequestType.UVGI_TROUBLESHOOTING)) {
				UserFormResult uvgiInstallationUserFormResult = getUserFormResultForUVGIInstallationByUVGIId(params
						.get("ID").toString());
				if (uvgiInstallationUserFormResult == null) {
					response = "ERROR";
					responseDetail = "Detail: No UVGI Light Record found for Id:"
							+ params.get("ID").toString() + " in the system.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				UserForm userForm = uvgiInstallationUserFormResult
						.getUserForm();
				Date installationDate = userForm.getDateEntered();
				if (dateEntered.before(installationDate)) {
					response = "ERROR";
					responseDetail = "Detail: Invalid Form Date. Selected date is before the recorded installation date ("
							+ (installationDate.toString().split(" "))[0]
							+ ") of the light.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				String troubleshootId = params.get("TROUBLESHOOT_NUMBER")
						.toString();
				String id = params.get("ID").toString();
				String problem = params.get("PROBLEM").toString();
				String uname = ServerService.getCurrentUser().getUsername();
				if (uname.equals("aic_guest"))
					uname = params.get("NAME").toString() + " - "
							+ params.get("EMAIL").toString();
				String user = ServerService.getCurrentUser().getFullName()
						+ " ( " + uname + " )";
				String facility = "";
				String opd = "";
				String area = "";
				String date = DateTimeUtil.toSqlDateString(dateEntered);
				List<UserFormResult> resultsForm = apiService
						.getUserFormService().getUserFormResultsByUserForm(
								uvgiInstallationUserFormResult.getUserForm());
				for (UserFormResult result : resultsForm) {
					if (result.getElement().getElementName()
							.equals("UVGI_INSTALL_LOCATION")) {
						facility = result.getResult();
					} else if (result.getElement().getElementName()
							.equals("OPD")) {
						opd = result.getResult();
					} else if (result.getElement().getElementName()
							.equals("OPD_AREA")) {
						area = result.getResult();
					}
				}
				String text = "Issue logged by " + user + " on " + date
						+ "\n\n" + "UVGI Light Id - " + id + " \n"
						+ "Troubleshoot Id - " + troubleshootId + " \n"
						+ "Facility - " + facility + " \n" + "OPD - " + opd
						+ " \n" + "OPD Area - " + area + " \n\n"
						+ "PROBLEM: \n" + problem;
				jsonResponse = doUvgiTroubleshooting(requestType, dateEntered,
						seconds, params, text);
			} else if (requestType.equals(RequestType.UVGI_TROUBLESHOOT_STATUS)) {
				UserFormResult uvgiInstallationUserFormResult = getUserFormResultForUVGIInstallationByUVGIId(params
						.get("ID").toString());
				if (uvgiInstallationUserFormResult == null) {
					response = "ERROR";
					responseDetail = "Detail: No UVGI Light Record found for Id:"
							+ params.get("ID").toString() + " in the system.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				UserFormResult uvgiTroubleshootUserFormResult = getUserFormResultForUVGITroubleshootByUVGIId(
						params.get("ID").toString(),
						params.get("TROUBLESHOOT_NUMBER").toString());
				if (uvgiTroubleshootUserFormResult == null) {

					response = "ERROR";
					responseDetail = "Detail: No Issue found with Troubleshoot Id:"
							+ params.get("TROUBLESHOOT_NUMBER").toString()
							+ " logged against UVGI light for Id:"
							+ params.get("ID").toString() + " in the system.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;

				}
				if (!isIssueOpen(params.get("ID").toString(),
						params.get("TROUBLESHOOT_NUMBER").toString())) {

					response = "ERROR";
					responseDetail = "Detail: Troubleshoot Id:"
							+ params.get("TROUBLESHOOT_NUMBER").toString()
							+ " logged against UVGI light for Id:"
							+ params.get("ID").toString()
							+ " is already resolved.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				UserForm userForm = uvgiTroubleshootUserFormResult
						.getUserForm();
				Date complainDate = userForm.getDateEntered();
				if (dateEntered.before(complainDate)) {
					response = "ERROR";
					responseDetail = "Detail: Invalid Form Date. Selected date is before the recorded complaint logged date ("
							+ (complainDate.toString().split(" "))[0]
							+ ") of the light.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				String troubleshootId = params.get("TROUBLESHOOT_NUMBER")
						.toString();
				String id = params.get("ID").toString();
				String problem = "";
				String user = ServerService.getCurrentUser().getFullName()
						+ " ( " + ServerService.getCurrentUser().getUsername()
						+ " )";
				String facility = "";
				String opd = "";
				String area = "";
				String date = DateTimeUtil.toSqlDateString(dateEntered);
				List<UserFormResult> resultsForm = apiService
						.getUserFormService().getUserFormResultsByUserForm(
								uvgiInstallationUserFormResult.getUserForm());
				for (UserFormResult result : resultsForm) {
					if (result.getElement().getElementName()
							.equals("UVGI_INSTALL_LOCATION")) {
						facility = result.getResult();
					} else if (result.getElement().getElementName()
							.equals("OPD")) {
						opd = result.getResult();
					} else if (result.getElement().getElementName()
							.equals("OPD_AREA")) {
						area = result.getResult();
					}

				}
				resultsForm = apiService.getUserFormService()
						.getUserFormResultsByUserForm(
								uvgiTroubleshootUserFormResult.getUserForm());
				for (UserFormResult result : resultsForm) {
					if (result.getElement().getElementName().equals("PROBLEM")) {
						problem = result.getResult();
					}
				}
				String text = "Issue Status Changed to "
						+ params.get("STATUS").toString() + " by " + user
						+ " on " + date + "\n\n" + "UVGI Light Id - " + id
						+ " \n" + "Troubleshoot Id - " + troubleshootId + " \n"
						+ "Facility - " + facility + " \n" + "OPD - " + opd
						+ " \n" + "OPD Area - " + area + " \n\n"
						+ "PROBLEM: \n" + problem;
				jsonResponse = doUvgiTroubleshootStatus(requestType,
						dateEntered, seconds, params, text);
			} else if (requestType.equals(RequestType.UVGI_RESOLUTION)) {
				if (getUserFormResultForUVGIInstallationByUVGIId(params.get(
						"ID").toString()) == null) {
					response = "ERROR";
					responseDetail = "Detail: No UVGI Light Record found for Id:"
							+ params.get("ID").toString() + " in the system.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				UserFormResult result = getUserFormResultForUVGITroubleshootByUVGIId(
						params.get("ID").toString(),
						params.get("TROUBLESHOOT_NUMBER").toString());
				if (result == null) {
					response = "ERROR";
					responseDetail = "Detail: No Issue found with Troubleshoot Id:"
							+ params.get("TROUBLESHOOT_NUMBER").toString()
							+ " logged against UVGI light for Id:"
							+ params.get("ID").toString() + " in the system.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				if (!isIssueOpen(params.get("ID").toString(),
						params.get("TROUBLESHOOT_NUMBER").toString())) {
					response = "ERROR";
					responseDetail = "Detail: Troubleshoot Id:"
							+ params.get("TROUBLESHOOT_NUMBER").toString()
							+ " logged against UVGI light for Id:"
							+ params.get("ID").toString()
							+ " is already resolved.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				UserForm userForm = result.getUserForm();
				Date complainDate = userForm.getDateEntered();
				if (dateEntered.before(complainDate)) {
					response = "ERROR";
					responseDetail = "Detail: Invalid Form Date. Selected date is before the recorded complaint logged date ("
							+ (complainDate.toString().split(" "))[0]
							+ ") of the light.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					out.println(jsonResponse);
					out.flush();
					return;
				}
				jsonResponse = doUvgiResolution(requestType, dateEntered,
						seconds, params);
			} else {
				response = "ERROR";
				responseDetail = "Unknown request type";
				jsonResponse.put("response", response);
				jsonResponse.put("details", responseDetail);
			}
		}
		out.println(jsonResponse);
		out.flush();
		// out.close();
		return;
	}

	/* Web service methods */
	public JSONObject doLogin(String username, String password)
			throws JSONException {
		String response = "ERROR";
		String responseDetail = "Detail: Unable to authenticate, Please provide a valid username and password to login";
		JSONObject jsonResponse = new JSONObject();
		if (login(username, password)) {
			response = "SUCCESS";
			responseDetail = "Detail: Successfully login through username : "
					+ username;
			List<Privilege> privileges = ServerService
					.getCurrentUserPrivileges();
			int no = 0;
			for (int i = 0; i < privileges.size(); i++) {
				String privilege = privileges.get(i).getPrivilege();

				if (privilege.contains("AIC")) {
					no++;
					jsonResponse.put("privilege_" + no, privileges.get(i)
							.getPrivilege());
				}
			}
			jsonResponse.put("privilege_no", no);
		}
		jsonResponse.put("response", response);
		jsonResponse.put("details", responseDetail);
		return jsonResponse;
	}

	public JSONObject doUvgiInstallation(String formType, Date dateEntered,
			Long seconds, Map<String, Object> results) throws JSONException {
		String response = "";
		String responseDetail = "";
		JSONObject jsonResponse = new JSONObject();
		UserFormType userFormType = apiService.getUserFormService()
				.getUserFormTypeByName(formType.toString());
		UserForm userForm = new UserForm(userFormType,
				ServerService.getCurrentUser(), dateEntered,
				ServerService.getCurrentUser(),
				ServerService.getCurrentLocation(), new Date(), null);
		userForm.setDateEntered(dateEntered);
		userForm.setDurationSeconds(seconds.intValue());
		ArrayList<UserFormResult> userFormResults = new ArrayList<UserFormResult>();
		for (String key : results.keySet()) {
			Element element = apiService.getEncounterService()
					.getElementByName(key);
			String value = results.get(key).toString();
			userFormResults.add(new UserFormResult(element, value, userForm));
		}
		try {
			userForm = apiService.getUserFormService().saveUserForm(userForm,
					userFormResults);
		} catch (PatternSyntaxException e) {
			e.printStackTrace();
		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		if (userForm.getUserFormId() != null) {
			response = "SUCCESS";
			responseDetail = "Detail: submitted installation form with id : "
					+ userForm.getUserFormId();
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
		} else {
			response = "ERROR";
			responseDetail = "Detail:  Unable to submit form";
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
		}
		return jsonResponse;
	}

	public JSONObject doUvgiMaintenance(String formType, Date dateEntered,
			Long seconds, Map<String, Object> results) throws JSONException {
		String response = "";
		String responseDetail = "";
		JSONObject jsonResponse = new JSONObject();
		UserFormType userFormType = apiService.getUserFormService()
				.getUserFormTypeByName(formType.toString());
		UserForm userForm = new UserForm(userFormType,
				ServerService.getCurrentUser(), dateEntered,
				ServerService.getCurrentUser(),
				ServerService.getCurrentLocation(), new Date(), null);
		userForm.setDateEntered(dateEntered);
		userForm.setDurationSeconds(seconds.intValue());
		ArrayList<UserFormResult> userFormResults = new ArrayList<UserFormResult>();
		for (String key : results.keySet()) {
			Element element = apiService.getEncounterService()
					.getElementByName(key);
			String value = results.get(key).toString();
			userFormResults.add(new UserFormResult(element, value, userForm));
		}
		try {
			userForm = apiService.getUserFormService().saveUserForm(userForm,
					userFormResults);
		} catch (PatternSyntaxException e) {
			e.printStackTrace();
		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		if (userForm.getUserFormId() != null) {
			response = "SUCCESS";
			responseDetail = "Detail: Submitted Maintenance form with id : "
					+ userForm.getUserFormId();
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
		} else {
			response = "ERROR";
			responseDetail = "Detail:  Unable to Submit Maintenance form";
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
		}
		return jsonResponse;
	}

	public JSONObject doUvgiTroubleshooting(String formType, Date dateEntered,
			Long seconds, Map<String, Object> results, String text)
			throws JSONException {
		String response = "";
		String responseDetail = "";
		JSONObject jsonResponse = new JSONObject();
		UserFormType userFormType = apiService.getUserFormService()
				.getUserFormTypeByName(formType.toString());
		UserForm userForm = new UserForm(userFormType,
				ServerService.getCurrentUser(), dateEntered,
				ServerService.getCurrentUser(),
				ServerService.getCurrentLocation(), new Date(), null);
		userForm.setDateEntered(dateEntered);
		userForm.setDurationSeconds(seconds.intValue());
		ArrayList<UserFormResult> userFormResults = new ArrayList<UserFormResult>();
		for (String key : results.keySet()) {
			Element element = apiService.getEncounterService()
					.getElementByName(key);
			String value = results.get(key).toString();
			userFormResults.add(new UserFormResult(element, value, userForm));
		}
		try {
			userForm = apiService.getUserFormService().saveUserForm(userForm,
					userFormResults);
			Map<String, Object> statusResults = new HashMap<String, Object>();
			statusResults.put("ID", results.get("ID"));
			statusResults.put("TROUBLESHOOT_NUMBER",
					results.get("TROUBLESHOOT_NUMBER"));
			statusResults.put("STATUS", "Complaint Logged");
			statusResults.put("STATUS_DATE", results.get("endtime"));
			doUvgiTroubleshootStatus(RequestType.UVGI_TROUBLESHOOT_STATUS,
					dateEntered, seconds, statusResults, "");
			sentEmail(
					"AIC (UVGI Light) - Issue# "
							+ results.get("TROUBLESHOOT_NUMBER").toString(),
					text);
		} catch (PatternSyntaxException e) {
			e.printStackTrace();
		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		if (userForm.getUserFormId() != null) {
			response = "SUCCESS";
			responseDetail = "Detail: Submitted TroubleShooting form with id : "
					+ userForm.getUserFormId();
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
		} else {
			response = "ERROR";
			responseDetail = "Detail:  Unable to Submit TroubleShooting form";
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
		}
		return jsonResponse;
	}

	public JSONObject doUvgiResolution(String formType, Date dateEntered,
			Long seconds, Map<String, Object> results) throws JSONException {
		String response = "";
		String responseDetail = "";
		JSONObject jsonResponse = new JSONObject();
		UserFormType userFormType = apiService.getUserFormService()
				.getUserFormTypeByName(formType.toString());
		UserForm userForm = new UserForm(userFormType,
				ServerService.getCurrentUser(), dateEntered,
				ServerService.getCurrentUser(),
				ServerService.getCurrentLocation(), new Date(), null);
		userForm.setDateEntered(dateEntered);
		userForm.setDurationSeconds(seconds.intValue());
		ArrayList<UserFormResult> userFormResults = new ArrayList<UserFormResult>();
		for (String key : results.keySet()) {
			Element element = apiService.getEncounterService()
					.getElementByName(key);
			String value = results.get(key).toString();
			userFormResults.add(new UserFormResult(element, value, userForm));
		}
		try {
			userForm = apiService.getUserFormService().saveUserForm(userForm,
					userFormResults);
		} catch (PatternSyntaxException e) {
			e.printStackTrace();
		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		if (userForm.getUserFormId() != null) {
			response = "SUCCESS";
			responseDetail = "Detail: Submitted Resolution form with id : "
					+ userForm.getUserFormId();
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
		} else {
			response = "ERROR";
			responseDetail = "Detail:  Unable to Submit Resolution form";
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
		}
		return jsonResponse;
	}

	public JSONObject doUvgiTroubleshootStatus(String formType,
			Date dateEntered, Long seconds, Map<String, Object> results,
			String text) throws JSONException {
		String response = "";
		String responseDetail = "";
		JSONObject jsonResponse = new JSONObject();
		UserFormType userFormType = apiService.getUserFormService()
				.getUserFormTypeByName(formType.toString());
		UserForm userForm = new UserForm(userFormType,
				ServerService.getCurrentUser(), dateEntered,
				ServerService.getCurrentUser(),
				ServerService.getCurrentLocation(), new Date(), null);
		userForm.setDateEntered(dateEntered);
		userForm.setDurationSeconds(seconds.intValue());
		ArrayList<UserFormResult> userFormResults = new ArrayList<UserFormResult>();
		for (String key : results.keySet()) {
			Element element = apiService.getEncounterService()
					.getElementByName(key);
			String value = results.get(key).toString();
			userFormResults.add(new UserFormResult(element, value, userForm));
		}
		try {
			userForm = apiService.getUserFormService().saveUserForm(userForm,
					userFormResults);
			if (!text.equals(""))
				sentEmail(
						"AIC (UVGI Light) - Issue# "
								+ results.get("TROUBLESHOOT_NUMBER").toString(),
						text);
			else
				return null;
		} catch (PatternSyntaxException e) {
			e.printStackTrace();
		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		if (userForm.getUserFormId() != null) {
			response = "SUCCESS";
			responseDetail = "Detail: Submitted Resolution form with id : "
					+ userForm.getUserFormId();
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
		} else {
			response = "ERROR";
			responseDetail = "Detail:  Unable to Submit Resolution form";
			jsonResponse.put("response", response);
			jsonResponse.put("details", responseDetail);
		}
		return jsonResponse;
	}

	public JSONObject getUVGIInstallationRecord(String id) {
		String response = "";
		String responseDetail = "";
		JSONObject jsonResponse = new JSONObject();
		UserFormResult uvgiInstallationUserFormResult = getUserFormResultForUVGIInstallationByUVGIId(id);
		if (uvgiInstallationUserFormResult == null) {
			response = "ERROR";
			responseDetail = "No UVGI Light Record found for " + id
					+ " in the system.";
			try {
				jsonResponse.put("response", response);
				jsonResponse.put("details", responseDetail);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		} else {
			response = "SUCCESS";
			responseDetail = "UVGI Light Record for " + id;
			try {
				jsonResponse.put("response", response);
				jsonResponse.put("details", responseDetail);
				jsonResponse.put("id", id);
			} catch (JSONException e) {
				e.printStackTrace();
			}
			List<UserFormResult> resultsForm = apiService.getUserFormService()
					.getUserFormResultsByUserForm(
							uvgiInstallationUserFormResult.getUserForm());
			for (UserFormResult result : resultsForm) {
				try {
					if (result.getElement().getElementName()
							.equals("UVGI_INSTALL_LOCATION")) {
						jsonResponse.put("location", result.getResult());
					} else if (result.getElement().getElementName()
							.equals("OPD")) {
						jsonResponse.put("opd", result.getResult());
					} else if (result.getElement().getElementName()
							.equals("OPD_AREA")) {
						jsonResponse.put("opd_area", result.getResult());
					} else if (result.getElement().getElementName()
							.equals("SZC_AREA")) {
						jsonResponse.put("szc_area", result.getResult());
					} else if (result.getElement().getElementName()
							.equals("LOCATION_TYPE")) {
						jsonResponse.put("location_type", result.getResult());
					}
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}
		}
		return jsonResponse;
	}

	public UserFormResult getUserFormResultForUVGIInstallationByUVGIId(String id) {
		UserFormResult uvgiResult = null;
		Boolean idExists = false;
		Element idElement = apiService.getEncounterService().getElementByName(
				"ID");
		UserFormType ungiInstallationForms = apiService.getUserFormService()
				.getUserFormTypeByName("UVGI_INSTALLATION");
		List<UserForm> installationForms = apiService.getUserFormService()
				.getUserFormsByType(ungiInstallationForms);
		for (UserForm installForm : installationForms) {
			List<UserFormResult> installationResults = apiService
					.getUserFormService().getUserFormResultsByUserForm(
							installForm);
			for (UserFormResult installFormResult : installationResults) {
				if (installFormResult.getResult().equals(id)
						&& installFormResult.getElement().getElementName()
								.equals(idElement.getElementName())) {
					idExists = true;
					uvgiResult = installFormResult;
				}
				if (idExists)
					break;
			}
			if (idExists)
				break;
		}
		return uvgiResult;
	}

	public JSONObject getUVGITroubleshootLog(String id, String troubleshootId) {
		String response = "";
		String responseDetail = "";
		JSONObject jsonResponse = new JSONObject();
		try {
			UserFormResult uvgiInstallationUserFormResult = getUserFormResultForUVGIInstallationByUVGIId(id);
			if (uvgiInstallationUserFormResult == null) {
				response = "ERROR";
				responseDetail = "No UVGI Light Record found for " + id
						+ " in the system.";
				jsonResponse.put("response", response);
				jsonResponse.put("details", responseDetail);
			} else {
				UserFormResult uvgiTroubleshootUserFormResult = getUserFormResultForUVGITroubleshootByUVGIId(
						id, troubleshootId);
				if (uvgiTroubleshootUserFormResult == null) {
					response = "ERROR";
					responseDetail = "No Issue found with Troubleshoot Id "
							+ troubleshootId + " logged against UVGI light "
							+ id + " in the system.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
				} else {
					response = "SUCCESS";
					responseDetail = "Troubleshoot Id " + troubleshootId
							+ " logged against UVGI light " + id;
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					jsonResponse.put("id", id);
					jsonResponse.put("troubleshootId", troubleshootId);
					List<UserFormResult> resultsForm = apiService
							.getUserFormService().getUserFormResultsByUserForm(
									uvgiInstallationUserFormResult
											.getUserForm());
					for (UserFormResult result : resultsForm) {
						if (result.getElement().getElementName()
								.equals("UVGI_INSTALL_LOCATION")) {
							jsonResponse.put("location", result.getResult());
						} else if (result.getElement().getElementName()
								.equals("OPD")) {
							jsonResponse.put("opd", result.getResult());
						} else if (result.getElement().getElementName()
								.equals("OPD_AREA")) {
							jsonResponse.put("opd_area", result.getResult());
						}
					}
					resultsForm = apiService.getUserFormService()
							.getUserFormResultsByUserForm(
									uvgiTroubleshootUserFormResult
											.getUserForm());
					for (UserFormResult result : resultsForm) {
						if (result.getElement().getElementName()
								.equals("PROBLEM")) {
							jsonResponse.put("problem", result.getResult());
							break;
						}
					}
				}
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonResponse;
	}

	public List<UserFormResult> getAllUserFormResultForUVGITroubleshootByUVGIId(
			String id) {
		List<UserFormResult> troubleshootResult = new ArrayList<UserFormResult>();
		List<UserFormResult> uvgiResults = new ArrayList<UserFormResult>();
		Element idElement = apiService.getEncounterService().getElementByName(
				"ID");
		UserFormType uvgiTroubleshootForms = apiService.getUserFormService()
				.getUserFormTypeByName("UVGI_TROUBLESHOOTING");
		List<UserForm> troubleshootForms = apiService.getUserFormService()
				.getUserFormsByType(uvgiTroubleshootForms);
		for (UserForm troubleshootForm : troubleshootForms) {
			List<UserFormResult> troubleshootResults = apiService
					.getUserFormService().getUserFormResultsByUserForm(
							troubleshootForm);
			for (UserFormResult troubleshootFormResult : troubleshootResults) {
				if (troubleshootFormResult.getResult().equals(id)
						&& troubleshootFormResult.getElement().getElementName()
								.equals(idElement.getElementName()))
					uvgiResults.add(troubleshootFormResult);
			}
		}
		for (UserFormResult uvgiResult : uvgiResults) {
			List<UserFormResult> resultsForm = apiService.getUserFormService()
					.getUserFormResultsByUserForm(uvgiResult.getUserForm());
			for (UserFormResult result : resultsForm) {
				if (result.getElement().getElementName()
						.equals("TROUBLESHOOT_NUMBER")) {
					troubleshootResult.add(result);
				}
			}
		}
		return troubleshootResult;
	}

	public UserFormResult getUserFormResultForUVGITroubleshootByUVGIId(
			String id, String troubleshoot) {
		UserFormResult troubleshootResult = null;
		List<UserFormResult> uvgiResults = new ArrayList<UserFormResult>();
		Element idElement = apiService.getEncounterService().getElementByName(
				"ID");
		UserFormType uvgiTroubleshootForms = apiService.getUserFormService()
				.getUserFormTypeByName("UVGI_TROUBLESHOOTING");
		List<UserForm> troubleshootForms = apiService.getUserFormService()
				.getUserFormsByType(uvgiTroubleshootForms);
		for (UserForm troubleshootForm : troubleshootForms) {
			List<UserFormResult> troubleshootResults = apiService
					.getUserFormService().getUserFormResultsByUserForm(
							troubleshootForm);
			for (UserFormResult troubleshootFormResult : troubleshootResults) {
				if (troubleshootFormResult.getResult().equals(id)
						&& troubleshootFormResult.getElement().getElementName()
								.equals(idElement.getElementName()))
					uvgiResults.add(troubleshootFormResult);
			}
		}
		for (UserFormResult uvgiResult : uvgiResults) {
			Boolean idExists = false;
			List<UserFormResult> resultsForm = apiService.getUserFormService()
					.getUserFormResultsByUserForm(uvgiResult.getUserForm());
			for (UserFormResult result : resultsForm) {
				if (result.getResult().equals(troubleshoot)
						&& result.getElement().getElementName()
								.equals("TROUBLESHOOT_NUMBER")) {
					idExists = true;
					troubleshootResult = result;
				}
				if (idExists)
					break;
			}
			if (idExists)
				break;
		}
		return troubleshootResult;
	}

	public JSONObject getUVGITroubleshootStatus(String id, String troubleshootId) {
		String response = "";
		String responseDetail = "";
		JSONObject jsonResponse = new JSONObject();
		try {
			UserFormResult uvgiInstallationUserFormResult = getUserFormResultForUVGIInstallationByUVGIId(id);
			if (uvgiInstallationUserFormResult == null) {
				response = "ERROR";
				responseDetail = "No UVGI Light Record found for " + id
						+ " in the system.";
				jsonResponse.put("response", response);
				jsonResponse.put("details", responseDetail);
			} else {
				UserFormResult uvgiTroubleshootUserFormResult = getUserFormResultForUVGITroubleshootByUVGIId(
						id, troubleshootId);
				if (uvgiTroubleshootUserFormResult == null) {
					response = "ERROR";
					responseDetail = "No Issue found with Troubleshoot Id "
							+ troubleshootId + " logged against UVGI light "
							+ id + " in the system.";
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					List<UserFormResult> uvgiAllTroubleshootResults = getAllUserFormResultForUVGITroubleshootByUVGIId(id);
					jsonResponse.put("troubleShoot_no",
							uvgiAllTroubleshootResults.size());
					for (int i = 0; i < uvgiAllTroubleshootResults.size(); i++) {
						jsonResponse.put("troubleShoot_" + i,
								uvgiAllTroubleshootResults.get(i).getResult());
					}
				} else {
					response = "SUCCESS";
					responseDetail = "Troubleshoot Id " + troubleshootId
							+ " logged against UVGI light " + id;
					jsonResponse.put("response", response);
					jsonResponse.put("details", responseDetail);
					jsonResponse.put("id", id);
					jsonResponse.put("troubleshootId", troubleshootId);
					List<UserFormResult> resultsForm = apiService
							.getUserFormService().getUserFormResultsByUserForm(
									uvgiInstallationUserFormResult
											.getUserForm());
					for (UserFormResult result : resultsForm) {
						if (result.getElement().getElementName()
								.equals("UVGI_INSTALL_LOCATION")) {
							jsonResponse.put("location", result.getResult());
						} else if (result.getElement().getElementName()
								.equals("OPD")) {
							jsonResponse.put("opd", result.getResult());
						} else if (result.getElement().getElementName()
								.equals("OPD_AREA")) {
							jsonResponse.put("opd_area", result.getResult());
						} else if (result.getElement().getElementName()
								.equals("SZC_AREA")) {
							jsonResponse.put("szc_area", result.getResult());
						} else if (result.getElement().getElementName()
								.equals("LOCATION_TYPE")) {
							jsonResponse.put("location_type",
									result.getResult());
						}
					}
					resultsForm = apiService.getUserFormService()
							.getUserFormResultsByUserForm(
									uvgiTroubleshootUserFormResult
											.getUserForm());
					for (UserFormResult result : resultsForm) {

						if (result.getElement().getElementName()
								.equals("PROBLEM")) {
							jsonResponse.put("problem", result.getResult());
							break;
						}
					}
					List<UserFormResult> uvgiTroubleshootStatusUserFormResult = getUserFormResultForUVGITroubleshootLatestStatusByUVGIId(
							id, troubleshootId);
					jsonResponse.put("no",
							uvgiTroubleshootStatusUserFormResult.size());
					int i = 1;
					for (UserFormResult result : uvgiTroubleshootStatusUserFormResult) {
						resultsForm = apiService.getUserFormService()
								.getUserFormResultsByUserForm(
										result.getUserForm());
						for (UserFormResult res : resultsForm) {
							if (res.getElement().getElementName()
									.equals("STATUS")) {
								jsonResponse
										.put("status_" + i, res.getResult());
							}
							if (res.getElement().getElementName()
									.equals("STATUS_DATE")) {
								jsonResponse.put("status_date_" + i,
										res.getResult());
							}
						}
						i++;
					}
				}
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonResponse;
	}

	public Boolean isIssueOpen(String id, String troubleshootIds) {
		Element idElement = apiService.getEncounterService().getElementByName(
				"ID");
		Element testIdElement = apiService.getEncounterService()
				.getElementByName("TROUBLESHOOT_NUMBER");
		Element statusElement = apiService.getEncounterService()
				.getElementByName("STATUS");
		UserFormType uvgiTroubleshootForms = apiService.getUserFormService()
				.getUserFormTypeByName("UVGI_TROUBLESHOOT_STATUS");

		List<UserForm> troubleshootForms = apiService.getUserFormService()
				.getUserFormsByType(uvgiTroubleshootForms);
		for (UserForm troubleshootForm : troubleshootForms) {

			List<UserFormResult> troubleshootResults = apiService
					.getUserFormService().getUserFormResultsByUserForm(
							troubleshootForm);
			Boolean idFlag = false;
			Boolean testIdFlag = false;
			Boolean statusFlag = false;
			for (UserFormResult troubleshootFormResult : troubleshootResults) {
				if (troubleshootFormResult.getResult().equals(id)
						&& troubleshootFormResult.getElement().getElementName()
								.equals(idElement.getElementName()))
					idFlag = true;
				else if (troubleshootFormResult.getResult().equals(
						troubleshootIds)
						&& troubleshootFormResult.getElement().getElementName()
								.equals(testIdElement.getElementName()))
					testIdFlag = true;
				else if (troubleshootFormResult.getResult().equals(
						"Issue Resolved")
						&& troubleshootFormResult.getElement().getElementName()
								.equals(statusElement.getElementName()))
					statusFlag = true;
			}
			if (idFlag && testIdFlag && statusFlag)
				return false;
		}
		return true;
	}

	public List<UserFormResult> getUserFormResultForUVGITroubleshootLatestStatusByUVGIId(
			String id, String troubleshootId) {
		List<UserFormResult> uvgiIdResults = new ArrayList<UserFormResult>();
		List<UserFormResult> uvgiTroubleshootIdResults = new ArrayList<UserFormResult>();
		Element idElement = apiService.getEncounterService().getElementByName(
				"ID");
		UserFormType uvgiTroubleshootForms = apiService.getUserFormService()
				.getUserFormTypeByName("UVGI_TROUBLESHOOT_STATUS");
		List<UserForm> troubleshootForms = apiService.getUserFormService()
				.getUserFormsByType(uvgiTroubleshootForms);
		for (UserForm troubleshootForm : troubleshootForms) {
			List<UserFormResult> troubleshootResults = apiService
					.getUserFormService().getUserFormResultsByUserForm(
							troubleshootForm);
			for (UserFormResult troubleshootFormResult : troubleshootResults) {
				if (troubleshootFormResult.getResult().equals(id)
						&& troubleshootFormResult.getElement().getElementName()
								.equals(idElement.getElementName()))
					uvgiIdResults.add(troubleshootFormResult);
			}
		}
		for (UserFormResult uvgiResult : uvgiIdResults) {
			List<UserFormResult> resultsForm = apiService.getUserFormService()
					.getUserFormResultsByUserForm(uvgiResult.getUserForm());
			for (UserFormResult result : resultsForm) {
				if (result.getResult().equals(troubleshootId)
						&& result.getElement().getElementName()
								.equals("TROUBLESHOOT_NUMBER")) {
					uvgiTroubleshootIdResults.add(result);
				}
			}
		}
		return uvgiTroubleshootIdResults;
	}

	public HashMap<String, Integer> getMetadata() {
		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		DefinitionType opdDefinitionType = apiService.getMetadataService()
				.getDefinitionTypeByName("OPD");
		List<Definition> opdDefinitions = apiService.getMetadataService()
				.getDefinitionsByDefinitionType(opdDefinitionType);
		hashMap.put("opd_size", opdDefinitions.size());
		DefinitionType opdAreaDefinitionType = apiService.getMetadataService()
				.getDefinitionTypeByName("OPD_AREA");
		List<Definition> opdAreaDefinitions = apiService.getMetadataService()
				.getDefinitionsByDefinitionType(opdAreaDefinitionType);
		hashMap.put("opd_area_size", opdAreaDefinitions.size());
		List<Location> locs = apiService.getLocationService().getAllLocations();
		int locSize = 0;
		for (int i = 0; i < locs.size(); i++) {
			List<LocationAttribute> locationAttributes = apiService
					.getLocationService().getLocationAttributesByLocation(
							locs.get(i));
			for (LocationAttribute la : locationAttributes) {
				if (la.getLocationAttributeType().getAttributeName()
						.equals("AIC Location")
						&& la.getAttributeValue().equals("true"))
					locSize++;
			}

		}
		hashMap.put("loc_size", locSize);
		return hashMap;
	}

	public JSONObject getUVGIMetadata() {
		JSONObject jsonResponse = new JSONObject();
		DefinitionType opdDefinitionType = apiService.getMetadataService()
				.getDefinitionTypeByName("OPD");
		List<Definition> opdDefinitions = apiService.getMetadataService()
				.getDefinitionsByDefinitionType(opdDefinitionType);
		try {
			jsonResponse.put("opd_size", opdDefinitions.size());
			for (int i = 0; i < opdDefinitions.size(); i++) {
				jsonResponse.put("opd_" + i, opdDefinitions.get(i)
						.getDefinition());
			}
			DefinitionType opdAreaDefinitionType = apiService
					.getMetadataService().getDefinitionTypeByName("OPD_AREA");
			List<Definition> opdAreaDefinitions = apiService
					.getMetadataService().getDefinitionsByDefinitionType(
							opdAreaDefinitionType);
			jsonResponse.put("opd_area_size", opdAreaDefinitions.size());
			for (int i = 0; i < opdAreaDefinitions.size(); i++) {
				jsonResponse.put("opd_area_" + i, opdAreaDefinitions.get(i)
						.getDefinition());
			}

			DefinitionType szcAreaDefinitionType = apiService
					.getMetadataService().getDefinitionTypeByName("SZC_AREA");
			List<Definition> szcAreaDefinitions = apiService
					.getMetadataService().getDefinitionsByDefinitionType(
							szcAreaDefinitionType);
			jsonResponse.put("szc_area_size", szcAreaDefinitions.size());
			for (int i = 0; i < szcAreaDefinitions.size(); i++) {
				jsonResponse.put("szc_area_" + i, szcAreaDefinitions.get(i)
						.getDefinition());
			}

			List<Location> locs = apiService.getLocationService()
					.getAllLocations();
			int locSize = 0;
			for (int i = 0; i < locs.size(); i++) {
				List<LocationAttribute> locationAttributes = apiService
						.getLocationService().getLocationAttributesByLocation(
								locs.get(i));
				for (LocationAttribute la : locationAttributes) {
					if (la.getLocationAttributeType().getAttributeName()
							.equals("AIC Location")
							&& la.getAttributeValue().equals("true")) {
						jsonResponse.put("loc_" + locSize, locs.get(i)
								.getDescription()
								+ " ("
								+ locs.get(i).getLocationName() + ")");
						locSize++;
					}
				}

			}
			jsonResponse.put("loc_size", locSize);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonResponse;
	}

}
