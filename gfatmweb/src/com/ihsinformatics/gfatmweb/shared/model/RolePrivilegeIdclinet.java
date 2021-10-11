/*
Copyright(C) 2016 Interactive Health Solutions, Pvt. Ltd.
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 3 of the License (GPLv3), or any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program; if not, write to the Interactive Health Solutions, info@ihsinformatics.com
You can also access the license on the internet at the address: http://www.gnu.org/licenses/gpl-3.0.html

Interactive Health Solutions, hereby disclaims all copyright interest in this program written by the contributors.
 */

/**
 * @author owais.hussain@ihsinformatics.com
 */

package com.ihsinformatics.gfatmweb.shared.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

// Generated Dec 9, 2015 9:08:22 PM by Hibernate Tools 3.4.0.CR1

/**
 * RolePrivilegeId generated by hbm2java
 */
@Embeddable
public class RolePrivilegeIdclinet implements java.io.Serializable {

	/**
     * 
     */
	private static final long serialVersionUID = -1133465118171628307L;
	private int roleId;
	private String privilege;

	public RolePrivilegeIdclinet() {
	}

	public RolePrivilegeIdclinet(int roleId, String privilege) {
		this.roleId = roleId;
		this.privilege = privilege;
	}

	@Column(name = "role_id", nullable = false)
	public int getRoleId() {
		return this.roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	@Column(name = "privilege", nullable = false, length = 45)
	public String getPrivilege() {
		return this.privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof RolePrivilegeIdclinet))
			return false;
		RolePrivilegeIdclinet castOther = (RolePrivilegeIdclinet) other;

		return (this.getRoleId() == castOther.getRoleId())
				&& ((this.getPrivilege() == castOther.getPrivilege()) || (this
						.getPrivilege() != null
						&& castOther.getPrivilege() != null && this
						.getPrivilege().equals(castOther.getPrivilege())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getRoleId();
		result = 37 * result
				+ (getPrivilege() == null ? 0 : this.getPrivilege().hashCode());
		return result;
	}

	@Override
	public String toString() {
		return roleId + ", " + privilege;
	}
}
