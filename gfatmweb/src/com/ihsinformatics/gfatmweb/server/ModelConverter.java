/*
Copyright(C) 2016 Interactive Health Solutions, Pvt. Ltd.
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 3 of the License (GPLv3), or any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program; if not, write to the Interactive Health Solutions, info@ihsinformatics.com
You can also access the license on the internet at the address: http://www.gnu.org/licenses/gpl-3.0.html

Interactive Health Solutions, hereby disclaims all copyright interest in this program written by the contributors.
 */

package com.ihsinformatics.gfatmweb.server;

import com.ihsinformatics.gfatmweb.shared.model.ElementClient;
import com.ihsinformatics.gfatmweb.shared.model.EncounterTypeClient;
import com.ihsinformatics.gfatmweb.shared.model.LocationAttributeClient;
import com.ihsinformatics.gfatmweb.shared.model.LocationAttributeTypeClient;
import com.ihsinformatics.gfatmweb.shared.model.LocationClient;
import com.ihsinformatics.gfatmweb.shared.model.PersonAttributeTypeClient;
import com.ihsinformatics.gfatmweb.shared.model.RoleClient;
import com.ihsinformatics.gfatmweb.shared.model.UserAttributeClient;
import com.ihsinformatics.gfatmweb.shared.model.UserAttributeTypeClient;
import com.ihsinformatics.gfatmweb.shared.model.UserFormClient;
import com.ihsinformatics.gfatmweb.shared.model.UserFormResultClient;
import com.ihsinformatics.gfatmweb.shared.model.UserFormTypeClient;
import com.ihsinformatics.gfatmweb.shared.model.UsersClient;
import com.ihsinformatics.tbreachapi.model.Element;
import com.ihsinformatics.tbreachapi.model.EncounterType;
import com.ihsinformatics.tbreachapi.model.Location;
import com.ihsinformatics.tbreachapi.model.LocationAttribute;
import com.ihsinformatics.tbreachapi.model.LocationAttributeType;
import com.ihsinformatics.tbreachapi.model.PersonAttributeType;
import com.ihsinformatics.tbreachapi.model.Role;
import com.ihsinformatics.tbreachapi.model.UserAttribute;
import com.ihsinformatics.tbreachapi.model.UserAttributeType;
import com.ihsinformatics.tbreachapi.model.UserForm;
import com.ihsinformatics.tbreachapi.model.UserFormResult;
import com.ihsinformatics.tbreachapi.model.UserFormType;
import com.ihsinformatics.tbreachapi.model.Users;

/**
 * @author owais.hussain@ihsinformatics.com
 *
 */
public class ModelConverter {

	public ModelConverter() {
	}

	/**
	 * Returns UsersClient object with minimal properties set, by converting
	 * from Users object
	 * 
	 * @param user
	 * @return
	 */
	public UsersClient getSimpleUsersClient(Users user) {
		if (user == null) {
			return null;
		}
		UsersClient userClient = new UsersClient();
		userClient.setUserId(user.getUserId());
		userClient.setUsername(user.getUsername());
		userClient.setUuid(user.getUuid());
		return userClient;
	}

	/**
	 * Returns Users object with minimal properties set, by converting from
	 * UsersClient object
	 * 
	 * @param userClient
	 * @return
	 */
	public Users getSimpleUsers(UsersClient userClient) {
		if (userClient == null) {
			return null;
		}
		Users user = new Users();
		user.setUserId(userClient.getUserId());
		user.setUsername(userClient.getUsername());
		user.setUuid(userClient.getUuid());
		return user;
	}

	/**
	 * Returns Location object with minimal properties set, by converting from
	 * LocationClient object
	 * 
	 * @param location
	 * @return
	 */
	public LocationClient getSimpleLocationClient(Location location) {
		if (location == null) {
			return null;
		}
		LocationClient locationClient = new LocationClient();
		locationClient.setLocationId(location.getLocationId());
		locationClient.setLocationName(location.getLocationName());
		locationClient.setUuid(location.getUuid());
		return locationClient;
	}

	/**
	 * Returns LocationClient object with minimal properties set, by converting
	 * from Location object
	 * 
	 * @param locationClient
	 * @return
	 */
	public Location getSimpleLocation(LocationClient locationClient) {
		if (locationClient == null) {
			return null;
		}
		Location location = new Location();
		location.setLocationId(locationClient.getLocationId());
		location.setLocationName(locationClient.getLocationName());
		location.setUuid(locationClient.getUuid());
		return location;
	}

	/**
	 * Returns UsersClient object by converting from Users object
	 * 
	 * @param user
	 * @return
	 */
	public UsersClient convertUsersToUsersClient(Users user) {
		UsersClient userClient = new UsersClient();
		userClient.setUserId(user.getUserId());
		userClient.setUsername(user.getUsername());
		userClient.setFullName(user.getFullName());
		userClient.setGlobalDataAccess(user.getGlobalDataAccess());
		userClient.setDisabled(user.getDisabled());
		userClient.setReasonDisabled(user.getReasonDisabled());
		userClient.setSecretQuestion(user.getSecretQuestion());
		userClient.setDateCreated(user.getDateCreated());
		if (user.getCreatedBy() != null) {
			Users createdBy = user.getCreatedBy();
			userClient.setUsersByCreatedBy(getSimpleUsersClient(createdBy));
		}
		if (user.getCreatedAt() != null) {
			userClient.setLocationByCreatedAt(getSimpleLocationClient(user
					.getCreatedAt()));
		}
		userClient.setDateChanged(user.getDateChanged());
		if (user.getChangedBy() != null)
			userClient.setUsersByChangedBy(getSimpleUsersClient(user
					.getChangedBy()));
		if (user.getChangedAt() != null)
			userClient.setLocationByChangedAt(getSimpleLocationClient(user
					.getChangedAt()));
		userClient.setUuid(user.getUuid());
		return userClient;
	}

	/**
	 * Returns Users object by converting from UsersClient object
	 * 
	 * @param userClient
	 * @return
	 */
	public Users convertUsersClientToUsers(UsersClient userClient) {
		Users user = new Users();
		user.setUserId(userClient.getUserId());
		user.setUsername(userClient.getUsername());
		user.setFullName(userClient.getFullName());
		user.setGlobalDataAccess(userClient.getGlobalDataAccess());
		user.setDisabled(userClient.getDisabled());
		user.setReasonDisabled(userClient.getReasonDisabled());
		user.setSecretQuestion(userClient.getSecretQuestion());
		user.setDateCreated(userClient.getDateCreated());
		user.setCreatedBy(getSimpleUsers(userClient.getUsersByCreatedBy()));
		user.setCreatedAt(getSimpleLocation(userClient.getLocationByCreatedAt()));

		user.setDateChanged(user.getDateChanged());
		user.setChangedBy(getSimpleUsers(userClient.getUsersByChangedBy()));
		user.setChangedAt(getSimpleLocation(userClient.getLocationByChangedAt()));

		user.setUuid(userClient.getUuid());

		return user;
	}

	/**
	 * 
	 * @param locationAttributeType
	 * @return
	 */
	public LocationAttributeTypeClient convertLocationAttributeTypetoLocationAttributeTypeClient(
			LocationAttributeType locationAttributeType) {
		LocationAttributeTypeClient object = new LocationAttributeTypeClient();
		object.setLocationAttributeTypeId(locationAttributeType
				.getLocationAttributeTypeId());
		object.setAttributeName(locationAttributeType.getAttributeName());
		object.setValidationRegex(locationAttributeType.getValidationRegex());
		object.setRequired(locationAttributeType.getRequired());
		object.setDescription(locationAttributeType.getDescription());
		object.setDataType(locationAttributeType.getDataType());
		object.setDateCreated(locationAttributeType.getDateCreated());
		object.setDateChanged(locationAttributeType.getDateChanged());
		Users createdBy = locationAttributeType.getCreatedBy();
		if (createdBy != null) {
			object.setUsersByCreatedBy(convertUsersToUsersClient(createdBy));
		}
		Users changedBy = locationAttributeType.getChangedBy();
		if (changedBy != null) {
			object.setUsersByChangedBy(convertUsersToUsersClient(changedBy));
		}
		Location createdAt = locationAttributeType.getCreatedAt();
		if (createdAt != null) {
			object.setLocationByCreatedAt(getSimpleLocationClient(createdAt));
		}
		Location changedAt = locationAttributeType.getChangedAt();
		if (changedAt != null) {
			object.setLocationByChangedAt(getSimpleLocationClient(changedAt));
		}
		object.setUuid(locationAttributeType.getUuid());
		return object;
	}

	/**
	 * 
	 * @param locationAttributeType
	 * @return
	 */
	public LocationAttributeType LocationAttributeTypeClientToLocationAttributeType(
			LocationAttributeTypeClient locationAttributeType) {
		LocationAttributeType object = new LocationAttributeType();
		object.setLocationAttributeTypeId(locationAttributeType
				.getLocationAttributeTypeId());
		object.setAttributeName(locationAttributeType.getAttributeName());
		object.setValidationRegex(locationAttributeType.getValidationRegex());
		object.setRequired(locationAttributeType.getRequired());
		object.setDescription(locationAttributeType.getDescription());
		object.setDataType(locationAttributeType.getDataType());
		return object;
	}

	/**
	 * 
	 * @param location
	 * @return
	 */
	public LocationClient LocationToLocationClient(Location location) {
		LocationClient locationClient = new LocationClient();
		locationClient.setLocationId(location.getLocationId());
		locationClient.setLocationName(location.getLocationName());
		locationClient.setCategory(location.getCategory());
		locationClient.setDescription(location.getDescription());
		locationClient.setAddress1(location.getAddress1());
		locationClient.setAddress2(location.getAddress2());
		locationClient.setAddress3(location.getAddress3());
		locationClient.setCityVillage(location.getCityVillage());
		locationClient.setStateProvince(location.getStateProvince());
		locationClient.setCountry(location.getCountry());
		locationClient.setLandmark1(location.getLandmark1());
		locationClient.setLandmark2(location.getLandmark2());
		locationClient.setLatitude(location.getLatitude());
		locationClient.setLongitude(location.getLongitude());
		locationClient.setPrimaryContact(location.getPrimaryContact());
		locationClient.setSecondaryContact(location.getSecondaryContact());
		locationClient.setEmail(location.getEmail());
		locationClient.setFax(location.getFax());
		locationClient
				.setLocationByParentLocation(getSimpleLocationClient(location
						.getLocationByParentLocation()));
		locationClient.setDateCreated(location.getDateCreated());
		locationClient.setDateChanged(location.getDateChanged());
		locationClient.setUuid(location.getUuid());
		Users createdBy = location.getCreatedBy();
		if (createdBy != null) {
			locationClient
					.setUsersByCreatedBy(convertUsersToUsersClient(createdBy));
		}
		Users changedBy = location.getCreatedBy();
		if (changedBy != null) {
			locationClient
					.setUsersByChangedBy(convertUsersToUsersClient(changedBy));
		}
		Location createdAt = location.getCreatedAt();
		if (createdAt != null) {
			locationClient
					.setLocationByCreatedAt(getSimpleLocationClient(createdAt));
		}
		Location changedAt = location.getChangedAt();
		if (changedAt != null) {
			locationClient
					.setLocationByChangedAt(getSimpleLocationClient(changedAt));
		}
		return locationClient;
	}

	public EncounterTypeClient convertEncounterTypetoEncounterTypeClient(
			EncounterType encounterType) {
		EncounterTypeClient encounterTypeClient = new EncounterTypeClient();
		encounterTypeClient.setEncounterTypeId(encounterType
				.getEncounterTypeId());
		encounterTypeClient.setEncounterType(encounterType.getEncounterType());
		encounterTypeClient.setDateChanged(encounterType.getDateChanged());
		encounterTypeClient.setDateCreated(encounterType.getDateCreated());
		Location createdAt = encounterType.getCreatedAt();
		if (createdAt != null) {
			encounterTypeClient
					.setLocationByCreatedAt(getSimpleLocationClient(createdAt));
		}
		Location changedAt = encounterType.getChangedAt();
		if (changedAt != null) {
			encounterTypeClient
					.setLocationByChangedAt(getSimpleLocationClient(changedAt));
		}
		Users createdBy = encounterType.getCreatedBy();
		if (createdBy != null) {
			encounterTypeClient
					.setUsersByCreatedBy(convertUsersToUsersClient(createdBy));
		}
		Users changedBy = encounterType.getCreatedBy();
		if (changedBy != null) {
			encounterTypeClient
					.setUsersByChangedBy(convertUsersToUsersClient(changedBy));
		}
		encounterTypeClient.setUuid(encounterType.getUuid());
		return encounterTypeClient;
	}

	public UserFormTypeClient convertUserFormTypetoUserFormTypeClient(
			UserFormType userFormType) {
		UserFormTypeClient userFormTypeClient = new UserFormTypeClient();
		userFormTypeClient.setUserFormTypeId(userFormType.getUserFormTypeId());
		userFormTypeClient.setUserFormType(userFormType.getUserFormType());
		userFormTypeClient.setDateCreated(userFormType.getDateCreated());
		userFormTypeClient.setDateChanged(userFormType.getDateChanged());
		userFormTypeClient.setDescription(userFormType.getDescription());
		Location createdAt = userFormType.getCreatedAt();
		if (createdAt != null) {
			userFormTypeClient
					.setLocationByCreatedAt(getSimpleLocationClient(createdAt));
		}
		Location changedAt = userFormType.getChangedAt();
		if (changedAt != null) {
			userFormTypeClient
					.setLocationByChangedAt(getSimpleLocationClient(changedAt));
		}
		Users createdBy = userFormType.getCreatedBy();
		if (createdBy != null) {
			userFormTypeClient
					.setUsersByCreatedBy(convertUsersToUsersClient(createdBy));
		}
		Users changedBy = userFormType.getChangedBy();
		if (changedBy != null) {
			userFormTypeClient
					.setUsersByChangedBy(convertUsersToUsersClient(changedBy));
		}
		userFormTypeClient.setUuid(userFormType.getUuid());
		return userFormTypeClient;
	}

	public UserFormType convertUserFormTypeClienttoUserFormType(
			UserFormTypeClient userFormTypeClient) {
		UserFormType userFormType = new UserFormType();
		userFormType.setUserFormTypeId(userFormTypeClient.getUserFormTypeId());
		userFormType.setUserFormType(userFormTypeClient.getUserFormType());
		userFormType.setDateCreated(userFormTypeClient.getDateCreated());
		userFormType.setDateChanged(userFormTypeClient.getDateChanged());
		userFormType.setDescription(userFormTypeClient.getDescription());
		Location createdAt = getSimpleLocation(userFormTypeClient.getLocationByCreatedAt());
		if (createdAt != null) {
			userFormType.setCreatedAt(createdAt);
		}
		Location changedAt = getSimpleLocation(userFormTypeClient.getLocationByChangedAt());
		if (changedAt != null) {
			userFormType.setChangedAt(changedAt);
		}
		Users createdBy = getSimpleUsers(userFormTypeClient.getUsersByCreatedBy());
		if (createdBy != null) {
			userFormType.setCreatedBy(createdBy);
		}
		Users changedBy = getSimpleUsers(userFormTypeClient.getUsersByChangedBy());
		if (changedBy != null) {
			userFormType.setChangedBy(changedBy);
		}
		userFormType.setUuid(userFormTypeClient.getUuid());
		return userFormType;
	}

	public RoleClient convertRoletoRoleClient(Role role) {
		RoleClient roleClient = new RoleClient();
		roleClient.setRoleId(role.getRoleId());
		roleClient.setRoleName(role.getRoleName());
		roleClient.setDateCreated(role.getDateCreated());
		roleClient.setDateChanged(role.getDateChanged());
		Location createdAt = role.getCreatedAt();
		if (createdAt != null) {
			roleClient
					.setLocationByCreatedAt(getSimpleLocationClient(createdAt));
		}
		Location changedAt = role.getChangedAt();
		if (changedAt != null) {
			roleClient
					.setLocationByChangedAt(getSimpleLocationClient(changedAt));
		}
		Users createdBy = role.getCreatedBy();
		if (createdBy != null) {
			roleClient
					.setUsersByCreatedBy(convertUsersToUsersClient(createdBy));
		}
		Users changedBy = role.getCreatedBy();
		if (changedBy != null) {
			roleClient
					.setUsersByChangedBy(convertUsersToUsersClient(changedBy));
		}
		roleClient.setUuid(role.getUuid());
		return roleClient;
	}

	public UserAttributeClient convertUserAttributeToUserAttributeClient(
			UserAttribute userAttribute) {
		UserAttributeClient userAttributeClient = new UserAttributeClient();
		userAttributeClient.setUserAttributeId(userAttribute
				.getUserAttributeId());
		userAttributeClient
				.setAttributeValue(userAttribute.getAttributeValue());
		if (userAttribute.getDateCreated() != null) {
			userAttributeClient.setDateCreated(userAttribute.getDateCreated());
		}
		if (userAttribute.getDateChanged() != null) {
			userAttributeClient.setDateChanged(userAttribute.getDateChanged());
		}
		userAttributeClient.setUuid(userAttribute.getUuid());
		Location createdAt = userAttribute.getCreatedAt();
		if (createdAt != null) {
			userAttributeClient
					.setLocationByCreatedAt(getSimpleLocationClient(createdAt));
		}
		Location changedAt = userAttribute.getChangedAt();
		if (changedAt != null) {
			userAttributeClient
					.setLocationByChangedAt(getSimpleLocationClient(changedAt));
		}
		Users createdBy = userAttribute.getCreatedBy();
		if (createdBy != null) {
			userAttributeClient
					.setUsersByCreatedBy(convertUsersToUsersClient(createdBy));
		}
		Users changedBy = userAttribute.getChangedBy();
		if (changedBy != null) {
			userAttributeClient
					.setUsersByChangedBy(convertUsersToUsersClient(changedBy));
		}
		userAttributeClient
				.setUserAttributeType(convertUserAttributeTypeToUserAttributeTypeClient(userAttribute
						.getUserAttributeType()));
		userAttributeClient.setUserId(convertUsersToUsersClient(userAttribute
				.getUserId()));
		return userAttributeClient;
	}

	public UserAttribute convertUserAttributeClientToUserAttribute(
			UserAttributeClient userAttributeClient) {
		UserAttribute userAttribute = new UserAttribute();
		userAttribute.setUserAttributeId(userAttributeClient
				.getUserAttributeId());
		userAttribute
				.setAttributeValue(userAttributeClient.getAttributeValue());
		if (userAttributeClient.getDateCreated() != null) {
			userAttribute.setDateCreated(userAttributeClient.getDateCreated());
		}
		if (userAttributeClient.getDateChanged() != null) {
			userAttribute.setDateChanged(userAttributeClient.getDateChanged());
		}
		userAttribute.setUuid(userAttributeClient.getUuid());
		Location createdAt = getSimpleLocation(userAttributeClient.getLocationByCreatedAt());
		if (createdAt != null) {
			userAttribute.setCreatedAt(createdAt);
		}
		Location changedAt = getSimpleLocation(userAttributeClient.getLocationByChangedAt());
		if (changedAt != null) {
			userAttribute.setChangedAt(changedAt);
		}
		Users createdBy = getSimpleUsers(userAttributeClient.getUsersByCreatedBy());
		if (createdBy != null) {
			userAttribute.setCreatedBy(createdBy);
		}
		Users changedBy = getSimpleUsers(userAttributeClient.getUsersByChangedBy());
		if (changedBy != null) {
			userAttribute.setChangedBy(changedBy);
		}
		userAttribute
				.setUserAttributeType(convertUserAttributeTypeClientToUserAttributeType(userAttributeClient
						.getUserAttributeType()));
		userAttribute.setUserId(convertUsersClientToUsers((userAttributeClient
				.getUserId())));
		return userAttribute;
	}

	UserAttributeTypeClient convertUserAttributeTypeToUserAttributeTypeClient(
			UserAttributeType userAttributeType) {
		UserAttributeTypeClient userAttributeTypeClient = new UserAttributeTypeClient();
		userAttributeTypeClient.setUserAttributeTypeId(userAttributeType
				.getUserAttributeTypeId());
		userAttributeTypeClient.setAttributeName(userAttributeType
				.getAttributeName());
		userAttributeTypeClient.setDataType(userAttributeType.getDataType());
		if (userAttributeType.getDateChanged() != null) {
			userAttributeTypeClient.setDateChanged(userAttributeType
					.getDateChanged());
		}
		if (userAttributeType.getDateCreated() != null) {
			userAttributeTypeClient.setDateCreated(userAttributeType
					.getDateCreated());
		}
		userAttributeTypeClient.setDescription(userAttributeType
				.getDescription());
		userAttributeTypeClient.setRequired(userAttributeType.getRequired());
		userAttributeTypeClient.setUuid(userAttributeType.getUuid());
		userAttributeTypeClient.setValidationRegex(userAttributeType
				.getValidationRegex());
		LocationClient createdAt = getSimpleLocationClient(userAttributeType
				.getCreatedAt());
		if (createdAt != null) {
			userAttributeTypeClient.setLocationByCreatedAt(createdAt);
		}
		LocationClient changedAt = getSimpleLocationClient(userAttributeType
				.getChangedAt());
		if (changedAt != null) {
			userAttributeTypeClient.setLocationByChangedAt(changedAt);
		}
		UsersClient createdBy = getSimpleUsersClient(userAttributeType
				.getCreatedBy());
		if (createdBy != null) {
			userAttributeTypeClient.setUsersByCreatedBy(createdBy);
		}
		UsersClient changedBy = getSimpleUsersClient(userAttributeType
				.getChangedBy());
		if (changedBy != null) {
			userAttributeTypeClient.setUsersByChangedBy(changedBy);
		}
		return userAttributeTypeClient;
	}

	UserAttributeType convertUserAttributeTypeClientToUserAttributeType(
			UserAttributeTypeClient userAttributeTypeClient) {
		UserAttributeType userAttributeType = new UserAttributeType();
		userAttributeType.setUserAttributeTypeId(userAttributeTypeClient
				.getUserAttributeTypeId());
		userAttributeType.setAttributeName(userAttributeTypeClient
				.getAttributeName());
		userAttributeType.setDataType(userAttributeTypeClient.getDataType());
		if (userAttributeTypeClient.getDateChanged() != null) {
			userAttributeType.setDateChanged(userAttributeTypeClient
					.getDateChanged());
		}
		if (userAttributeTypeClient.getDateCreated() != null) {
			userAttributeType.setDateCreated(userAttributeTypeClient
					.getDateCreated());
		}
		userAttributeType.setDescription(userAttributeTypeClient
				.getDescription());
		userAttributeType.setRequired(userAttributeTypeClient.getRequired());
		userAttributeType.setUuid(userAttributeTypeClient.getUuid());
		userAttributeType.setValidationRegex(userAttributeTypeClient
				.getValidationRegex());
		Location createdAt = getSimpleLocation(userAttributeTypeClient.getLocationByCreatedAt());
		if (createdAt != null) {
			userAttributeType.setCreatedAt(createdAt);
		}
		Location changedAt = getSimpleLocation(userAttributeTypeClient.getLocationByChangedAt());
		if (changedAt != null) {
			userAttributeType.setChangedAt(changedAt);
		}
		Users createdBy = getSimpleUsers(userAttributeTypeClient.getUsersByCreatedBy());
		if (createdBy != null) {
			userAttributeType.setCreatedBy(createdBy);
		}
		Users changedBy = getSimpleUsers(userAttributeTypeClient.getUsersByChangedBy());
		if (changedBy != null) {
			userAttributeType.setChangedBy(changedBy);
		}
		return userAttributeType;
	}

	PersonAttributeTypeClient convertPersonAttributeTypeToPersonAttributeTypeClient(
			PersonAttributeType personAttributeType) {
		PersonAttributeTypeClient personAttributeTypeClient = new PersonAttributeTypeClient();
		personAttributeTypeClient.setPersonAttributeTypeId(personAttributeType
				.getPersonAttributeTypeId());
		personAttributeTypeClient.setAttributeName(personAttributeType
				.getAttributeName());
		personAttributeTypeClient
				.setDataType(personAttributeType.getDataType());
		if (personAttributeType.getDateChanged() != null) {
			personAttributeTypeClient.setDateChanged(personAttributeType
					.getDateChanged());
		}
		if (personAttributeType.getDateCreated() != null) {
			personAttributeTypeClient.setDateCreated(personAttributeType
					.getDateCreated());
		}
		personAttributeTypeClient.setDescription(personAttributeType
				.getDescription());
		personAttributeTypeClient
				.setRequired(personAttributeType.getRequired());
		personAttributeTypeClient.setUuid(personAttributeType.getUuid());
		personAttributeTypeClient.setValidationRegex(personAttributeType
				.getValidationRegex());
		LocationClient createdAt = getSimpleLocationClient(personAttributeType.getChangedAt());
		if (createdAt != null) {
			personAttributeTypeClient.setLocationByCreatedAt(createdAt);
		}
		LocationClient changedAt = getSimpleLocationClient(personAttributeType.getChangedAt());
		if (changedAt != null) {
			personAttributeTypeClient.setLocationByChangedAt(changedAt);
		}
		UsersClient createdBy = getSimpleUsersClient(personAttributeType
				.getCreatedBy());
		if (createdBy != null) {
			personAttributeTypeClient.setUsersByCreatedBy(createdBy);
		}
		UsersClient changedBy = getSimpleUsersClient(personAttributeType
				.getChangedBy());
		if (changedBy != null) {
			personAttributeTypeClient.setUsersByChangedBy(changedBy);
		}
		return personAttributeTypeClient;
	}

	PersonAttributeType convertPersonAttributeTypeClientToPersonAttributeType(
			PersonAttributeTypeClient personAttributeTypeClient) {
		PersonAttributeType personAttributeType = new PersonAttributeType();
		personAttributeType.setPersonAttributeTypeId(personAttributeTypeClient
				.getPersonAttributeTypeId());
		personAttributeType.setAttributeName(personAttributeTypeClient
				.getAttributeName());
		personAttributeType
				.setDataType(personAttributeTypeClient.getDataType());
		if (personAttributeTypeClient.getDateChanged() != null) {
			personAttributeTypeClient.setDateChanged(personAttributeTypeClient
					.getDateChanged());
		}
		if (personAttributeTypeClient.getDateCreated() != null) {
			personAttributeTypeClient.setDateCreated(personAttributeTypeClient
					.getDateCreated());
		}
		personAttributeType.setDescription(personAttributeTypeClient
				.getDescription());
		personAttributeType
				.setRequired(personAttributeTypeClient.getRequired());
		personAttributeType.setUuid(personAttributeTypeClient.getUuid());
		personAttributeType.setValidationRegex(personAttributeTypeClient
				.getValidationRegex());
		Location createdAt = getSimpleLocation(personAttributeTypeClient.getLocationByCreatedAt());
		if (createdAt != null) {
			personAttributeType.setCreatedAt(createdAt);
		}
		Location changedAt = getSimpleLocation(personAttributeTypeClient.getLocationByChangedAt());
		if (changedAt != null) {
			personAttributeType.setChangedAt(changedAt);
		}
		Users createdBy = getSimpleUsers(personAttributeTypeClient.getUsersByCreatedBy());
		if (createdBy != null) {
			personAttributeType.setCreatedBy(createdBy);
		}
		Users changedBy = getSimpleUsers(personAttributeTypeClient.getUsersByChangedBy());
		if (changedBy != null) {
			personAttributeType.setChangedBy(changedBy);
		}
		return personAttributeType;
	}

	ElementClient convertElementToElementClient(Element element) {
		ElementClient elementClient = new ElementClient();
		elementClient.setElementId(element.getElementId());
		elementClient.setElementName(element.getElementName());
		elementClient.setValidationRegex(element.getValidationRegex());
		elementClient.setDataType(element.getDataType());
		elementClient.setDescription(element.getDescription());
		if (element.getDateChanged() != null) {
			elementClient.setDateChanged(element.getDateChanged());
		}
		if (element.getDateCreated() != null) {
			elementClient.setDateCreated(element.getDateCreated());
		}
		LocationClient createdAt = getSimpleLocationClient(element.getCreatedAt());
		if (createdAt != null) {
			elementClient.setLocationByCreatedAt(createdAt);
		}
		LocationClient changedAt = getSimpleLocationClient(element.getChangedAt());
		if (changedAt != null) {
			elementClient.setLocationByChangedAt(changedAt);
		}
		UsersClient createdBy = getSimpleUsersClient(element
				.getCreatedBy());
		if (createdBy != null) {
			elementClient.setUsersByCreatedBy(createdBy);
		}
		UsersClient changedBy = getSimpleUsersClient(element
				.getChangedBy());
		if (changedBy != null) {
			elementClient.setUsersByChangedBy(changedBy);
		}
		elementClient.setUuid(element.getUuid());
		return elementClient;
	}

	Element convertElementClientToElement(ElementClient elementClient) {
		Element element = new Element();
		element.setElementId(elementClient.getElementId());
		element.setElementName(elementClient.getElementName());
		element.setValidationRegex(elementClient.getValidationRegex());
		element.setDataType(elementClient.getDataType());
		element.setDescription(elementClient.getDescription());
		if (elementClient.getDateChanged() != null) {
			element.setDateChanged(elementClient.getDateChanged());
		}
		if (elementClient.getDateCreated() != null) {
			element.setDateCreated(elementClient.getDateCreated());
		}
		Location createdAt = getSimpleLocation(elementClient.getLocationByCreatedAt());
		if (createdAt != null) {
			element.setCreatedAt(createdAt);
		}
		Location changedAt = getSimpleLocation(elementClient.getLocationByChangedAt());
		if (changedAt != null) {
			element.setChangedAt(changedAt);
		}
		Users createdBy = getSimpleUsers(elementClient.getUsersByCreatedBy());
		if (createdBy != null) {
			element.setCreatedBy(createdBy);
		}
		Users changedBy = getSimpleUsers(elementClient.getUsersByChangedBy());
		if (changedBy != null) {
			element.setChangedBy(changedBy);
		}
		element.setUuid(elementClient.getUuid());
		return element;
	}

	public Location LocationClientToLocation(LocationClient locationClient) {
		Location location = new Location();
		location.setLocationId(locationClient.getLocationId());
		location.setLocationName(locationClient.getLocationName());
		location.setCategory(locationClient.getCategory());
		location.setDescription(locationClient.getDescription());
		location.setAddress1(locationClient.getAddress1());
		location.setAddress2(locationClient.getAddress2());
		location.setAddress3(locationClient.getAddress3());
		location.setCityVillage(locationClient.getCityVillage());
		location.setStateProvince(locationClient.getStateProvince());
		location.setCountry(locationClient.getCountry());
		location.setLandmark1(locationClient.getLandmark1());
		location.setLandmark2(locationClient.getLandmark2());
		location.setLatitude(locationClient.getLatitude());
		location.setLongitude(locationClient.getLongitude());
		location.setPrimaryContact(locationClient.getPrimaryContact());
		location.setSecondaryContact(locationClient.getSecondaryContact());
		location.setEmail(locationClient.getEmail());
		location.setFax(locationClient.getFax());
		location.setLocationByParentLocation(getSimpleLocation(locationClient
				.getLocationByParentLocation()));
		location.setDateCreated(locationClient.getDateCreated());
		location.setDateChanged(locationClient.getDateChanged());
		location.setUuid(locationClient.getUuid());
		UsersClient createdBy = locationClient.getUsersByCreatedBy();
		if (createdBy != null) {
			location.setCreatedBy(getSimpleUsers(createdBy));
		}
		UsersClient changedBy = locationClient.getUsersByChangedBy();
		if (changedBy != null) {
			location.setChangedBy(getSimpleUsers(changedBy));
		}
		LocationClient createdAt = locationClient.getLocationByCreatedAt();
		if (createdAt != null) {
			location.setCreatedAt(getSimpleLocation(createdAt));
		}
		LocationClient changedAt = locationClient.getLocationByChangedAt();
		if (changedAt != null) {
			location.setChangedAt(getSimpleLocation(changedAt));
		}
		return location;
	}

	public LocationAttributeClient convertLocationAttributeToLocationAttributeClient(
			LocationAttribute locationAttribute) {
		LocationAttributeClient locationAttributeClient = new LocationAttributeClient();
		locationAttributeClient.setLocationAttributeId(locationAttribute
				.getLocationAttributeId());
		locationAttributeClient.setAttributeValue(locationAttribute
				.getAttributeValue());
		if (locationAttribute.getDateCreated() != null) {
			locationAttributeClient.setDateCreated(locationAttribute
					.getDateCreated());
		}
		if (locationAttribute.getDateChanged() != null) {
			locationAttributeClient.setDateChanged(locationAttribute
					.getDateChanged());
		}
		locationAttributeClient.setUuid(locationAttribute.getUuid());
		LocationClient createdAt = getSimpleLocationClient(locationAttribute
				.getCreatedAt());
		if (createdAt != null) {
			locationAttributeClient.setLocationByCreatedAt(createdAt);
		}
		LocationClient changedAt = getSimpleLocationClient(locationAttribute
				.getChangedAt());
		if (changedAt != null) {
			locationAttributeClient.setLocationByChangedAt(changedAt);
		}
		UsersClient createdBy = getSimpleUsersClient(locationAttribute
				.getCreatedBy());
		if (createdBy != null) {
			locationAttributeClient.setUsersByCreatedBy(createdBy);
		}
		UsersClient changedBy = getSimpleUsersClient(locationAttribute
				.getChangedBy());
		if (changedBy != null) {
			locationAttributeClient.setUsersByChangedBy(changedBy);
		}
		locationAttributeClient
				.setLocationAttributeType(convertLocationAttributeTypetoLocationAttributeTypeClient(locationAttribute
						.getLocationAttributeType()));
		locationAttributeClient
				.setLocationByLocationId(getSimpleLocationClient(locationAttribute
						.getLocationId()));
		return locationAttributeClient;
	}

	UserFormClient convertUserFormtoUserFormClient(UserForm userForm) {
		UserFormClient userFormClient = new UserFormClient();
		userFormClient.setUserFormId(userForm.getUserFormId());
		userFormClient
				.setUserFormType(convertUserFormTypetoUserFormTypeClient(userForm
						.getUserFormType()));
		userFormClient
				.setUserId(convertUsersToUsersClient(userForm.getUserId()));
		userFormClient.setDurationSeconds(userForm.getDurationSeconds());
		userFormClient.setDateEntered(userForm.getDateEntered());
		if (userForm.getDateCreated() != null) {
			userFormClient.setDateCreated(userForm.getDateCreated());
		}
		if (userForm.getDateChanged() != null) {
			userFormClient.setDateChanged(userForm.getDateChanged());
		}
		userFormClient.setUuid(userForm.getUuid());
		LocationClient createdAt = getSimpleLocationClient(userForm
				.getCreatedAt());
		if (createdAt != null) {
			userFormClient.setLocationByCreatedAt(createdAt);
		}
		LocationClient changedAt = getSimpleLocationClient(userForm
				.getChangedAt());
		if (changedAt != null) {
			userFormClient.setLocationByChangedAt(changedAt);
		}
		UsersClient createdBy = getSimpleUsersClient(userForm
				.getCreatedBy());
		if (createdBy != null) {
			userFormClient.setUsersByCreatedBy(createdBy);
		}
		UsersClient changedBy = getSimpleUsersClient(userForm
				.getCreatedBy());
		if (changedBy != null) {
			userFormClient.setUsersByChangedBy(changedBy);
		}
		userFormClient.setUuid(userForm.getUuid());
		return userFormClient;
	}

	UserForm convertUserFormClientToUserForm(UserFormClient userFormClient) {
		UserForm userForm = new UserForm();
		userForm.setUserFormId(userFormClient.getUserFormId());
		userForm.setUserFormType(convertUserFormTypeClienttoUserFormType(userFormClient
				.getUserFormType()));
		userForm.setUserId(convertUsersClientToUsers(userFormClient.getUserId()));
		userForm.setDurationSeconds(userFormClient.getDurationSeconds());
		userForm.setDateEntered(userFormClient.getDateEntered());
		if (userFormClient.getDateCreated() != null) {
			userForm.setDateCreated(userFormClient.getDateCreated());
		}
		if (userFormClient.getDateChanged() != null) {
			userForm.setDateChanged(userFormClient.getDateChanged());
		}
		userForm.setUuid(userFormClient.getUuid());
		Location createdAt = getSimpleLocation(userFormClient.getLocationByCreatedAt());
		if (createdAt != null) {
			userForm.setCreatedAt(createdAt);
		}
		Location changedAt = getSimpleLocation(userFormClient.getLocationByChangedAt());
		if (changedAt != null) {
			userForm.setChangedAt(changedAt);
		}
		Users createdBy = getSimpleUsers(userFormClient.getUsersByCreatedBy());
		if (createdBy != null) {
			userForm.setCreatedBy(createdBy);
		}
		Users changedBy = getSimpleUsers(userFormClient.getUsersByChangedBy());
		if (changedBy != null) {
			userForm.setChangedBy(changedBy);
		}
		userForm.setUuid(userFormClient.getUuid());
		return userForm;
	}

	UserFormResultClient convertUserFormResultToUserFormClient(
			UserFormResult userFormResult) {
		UserFormResultClient userFormResultClient = new UserFormResultClient();
		userFormResultClient.setUserFormResultId(userFormResult
				.getUserFormResultId());
		userFormResultClient
				.setUserForm(convertUserFormtoUserFormClient(userFormResult
						.getUserForm()));
		userFormResultClient
				.setElement(convertElementToElementClient(userFormResult
						.getElement()));
		userFormResultClient.setResult(userFormResult.getResult());
		if (userFormResult.getDateCreated() != null) {
			userFormResultClient
					.setDateCreated(userFormResult.getDateCreated());
		}
		if (userFormResult.getDateChanged() != null) {
			userFormResultClient
					.setDateChanged(userFormResult.getDateChanged());
		}
		userFormResultClient.setUuid(userFormResult.getUuid());
		LocationClient createdAt = getSimpleLocationClient(userFormResult.getChangedAt());
		if (createdAt != null) {
			userFormResultClient.setLocationByCreatedAt(createdAt);
		}
		LocationClient changedAt = getSimpleLocationClient(userFormResult.getChangedAt());
		if (changedAt != null) {
			userFormResultClient.setLocationByChangedAt(changedAt);
		}
		UsersClient createdBy = getSimpleUsersClient(userFormResult
				.getCreatedBy());
		if (createdBy != null) {
			userFormResultClient.setUsersByCreatedBy(createdBy);
		}
		UsersClient changedBy = getSimpleUsersClient(userFormResult
				.getCreatedBy());
		if (changedBy != null) {
			userFormResultClient.setUsersByChangedBy(changedBy);
		}
		userFormResultClient.setUuid(userFormResult.getUuid());
		return userFormResultClient;
	}

}
