/* Copyright(C) 2016 Interactive Health Solutions, Pvt. Ltd.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 3 of the License (GPLv3), or any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program; if not, write to the Interactive Health Solutions, info@ihsinformatics.com
You can also access the license on the internet at the address: http://www.gnu.org/licenses/gpl-3.0.html

Interactive Health Solutions, hereby disclaims all copyright interest in this program written by the contributors.
 */

package com.ihsinformatics.gfatmweb.shared;

/**
 * @author owais
 *
 */
public class RequestType {
	/*
	 * Defined variable for each of form type to handle request
	 */
	/* AIC form types */
	public static final String LOGIN = "login";
	public static final String UVGI_INSTALLATION = "uvgi_installation";
	public static final String UVGI_MAINTENANCE = "uvgi_maintenance";
	public static final String UVGI_TROUBLESHOOTING = "uvgi_troubleshooting";
	public static final String UVGI_TROUBLESHOOT_STATUS = "uvgi_troubleshoot_status";
	public static final String UVGI_RESOLUTION = "uvgi_resolution";
	
	public static final String UVGI_GET_INSTALLATION_RECORD = "uvgi_get_installation_record";
	public static final String UVGI_GET_TROUBLESHOOT_RECORD = "uvgi_get_troubleshoot_record";
	public static final String UVGI_GET_TROUBLESHOOT_STATUS_RECORD = "uvgi_get_troubleshoot_status_record";
	public static final String UVGI_GET_METADATA = "uvgi_get_metadata";

	/* FAST form types */
	public static final String FAST_SCREENING = "fast_screening";
	
	/* ZTTS form */
	public static final String ZTTS_ENUMERATION_BLOCK = "ztts_enumeration_block_level";
    public static final String ZTTS_ENUMERATION_HOUSEHOLD = "ztts_enumeration_household_level";
	
	/* GFATM TASKS */
	public static final String GFATM_SEARCH = "gfatm_search";
	public static final String GFATM_FEEDBACK = "gfatm_feedback";
	public static final String GFATM_GET_LOCATION = "gfatm_get_location";
	
	/*CALL CENTER CRM CC_CRM_FORM  */
	public static final String CC_CRM_FORM = "cc_crm_form";
}
