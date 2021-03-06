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

// Generated Dec 9, 2015 9:08:22 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * UserRole generated by hbm2java
 */
@Entity
@Table(name = "user_role", uniqueConstraints = @UniqueConstraint(columnNames = "uuid"))
public class UserRoleClient implements java.io.Serializable {

	/**
     * 
     */
	private static final long serialVersionUID = -6697845334255455481L;
	private UserRoleIdClient id;
	private UsersClient usersByCreatedBy;
	private UsersClient usersByUserId;
	private RoleClient role;
	private LocationClient locationByCreatedAt;
	private LocationClient locationByChangedAt;
	private UsersClient usersByChangedBy;
	private Date dateCreated;
	private Date dateChanged;
	private String uuid;

	public UserRoleClient() {
	}

	public UserRoleClient(UserRoleIdClient id, UsersClient user, RoleClient role) {
		this.id = id;
		this.usersByUserId = user;
		this.role = role;
	}

	public UserRoleClient(UserRoleIdClient id, UsersClient user,
			RoleClient role, UsersClient createdBy, Date dateCreated,
			String uuid) {
		this.id = id;
		this.usersByUserId = user;
		this.role = role;
		this.usersByCreatedBy = createdBy;
		this.dateCreated = dateCreated;
		this.uuid = uuid;
	}

	public UserRoleClient(UserRoleIdClient id, UsersClient createdBy,
			UsersClient userId, RoleClient role, LocationClient createdAt,
			Date dateCreated, String uuid) {
		this.id = id;
		this.usersByCreatedBy = createdBy;
		this.usersByUserId = userId;
		this.role = role;
		this.locationByCreatedAt = createdAt;
		this.dateCreated = dateCreated;
		this.uuid = uuid;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "userId", column = @Column(name = "user_id", nullable = false)),
			@AttributeOverride(name = "roleId", column = @Column(name = "role_id", nullable = false)) })
	public UserRoleIdClient getId() {
		return this.id;
	}

	public void setId(UserRoleIdClient id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by")
	public UsersClient getUsersByCreatedBy() {
		return this.usersByCreatedBy;
	}

	public void setUsersByCreatedBy(UsersClient usersByCreatedBy) {
		this.usersByCreatedBy = usersByCreatedBy;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
	public UsersClient getUsersByUserId() {
		return this.usersByUserId;
	}

	public void setUsersByUserId(UsersClient usersByUserId) {
		this.usersByUserId = usersByUserId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "role_id", nullable = false, insertable = false, updatable = false)
	public RoleClient getRole() {
		return this.role;
	}

	public void setRole(RoleClient role) {
		this.role = role;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_at")
	public LocationClient getLocationByCreatedAt() {
		return this.locationByCreatedAt;
	}

	public void setLocationByCreatedAt(LocationClient locationByCreatedAt) {
		this.locationByCreatedAt = locationByCreatedAt;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "changed_at")
	public LocationClient getLocationByChangedAt() {
		return this.locationByChangedAt;
	}

	public void setLocationByChangedAt(LocationClient locationByChangedAt) {
		this.locationByChangedAt = locationByChangedAt;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "changed_by")
	public UsersClient getUsersByChangedBy() {
		return this.usersByChangedBy;
	}

	public void setUsersByChangedBy(UsersClient usersByChangedBy) {
		this.usersByChangedBy = usersByChangedBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_created", nullable = false, length = 19)
	public Date getDateCreated() {
		return this.dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_changed", length = 19)
	public Date getDateChanged() {
		return this.dateChanged;
	}

	public void setDateChanged(Date dateChanged) {
		this.dateChanged = dateChanged;
	}

	@Column(name = "uuid", unique = true, nullable = false, length = 38)
	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	@Override
	public String toString() {
		return id + ", " + dateCreated + ", " + dateChanged + ", " + uuid;
	}
}
