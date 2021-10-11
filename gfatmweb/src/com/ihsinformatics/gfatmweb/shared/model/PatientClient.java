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

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Patient generated by hbm2java
 */
@Entity
@Table(name = "patient", uniqueConstraints = @UniqueConstraint(columnNames = "uuid"))
public class PatientClient implements java.io.Serializable {

	/**
     * 
     */
	private static final long serialVersionUID = -8483578209858820804L;
	private int personId;
	private UsersClient usersByCreatedBy;
	private UsersClient usersByClosedBy;
	private LocationClient locationByCreatedAt;
	private LocationClient locationByChangedAt;
	private UsersClient usersByChangedBy;
	private PersonClient person;
	private String patientId;
	private String externalId1;
	private String externalId2;
	private String bloodGroup;
	private Double weight;
	private String weightUnit;
	private Double height;
	private String heightUnit;
	private Date dateClosed;
	private String reasonClosed;
	private Boolean died;
	private Date dateDied;
	private String deathCause;
	private String comments;
	private Date dateCreated;
	private Date dateChanged;
	private String uuid;

	public PatientClient() {
	}

	public PatientClient(PersonClient person, String patientId) {
		this.person = person;
		this.patientId = patientId;
	}

	public PatientClient(PersonClient person, String patientId,
			String externalId1, String bloodGroup, UsersClient createdBy,
			LocationClient createdAt, Date dateCreated, String uuid) {
		this.usersByCreatedBy = createdBy;
		this.locationByCreatedAt = createdAt;
		this.person = person;
		this.patientId = patientId;
		this.externalId1 = externalId1;
		this.bloodGroup = bloodGroup;
		this.dateCreated = dateCreated;
		this.uuid = uuid;
	}

	public PatientClient(UsersClient usersByCreatedBy,
			UsersClient usersByClosedBy, LocationClient locationByCreatedAt,
			LocationClient locationByChangedAt, UsersClient usersByChangedBy,
			PersonClient person, String patientId, String externalId1,
			String externalId2, String bloodGroup, Double weight,
			String weightUnit, Double height, String heightUnit,
			Date dateClosed, String reasonClosed, Boolean died, Date dateDied,
			String deathCause, String comments, Date dateCreated,
			Date dateChanged, String uuid) {
		this.usersByCreatedBy = usersByCreatedBy;
		this.usersByClosedBy = usersByClosedBy;
		this.locationByCreatedAt = locationByCreatedAt;
		this.locationByChangedAt = locationByChangedAt;
		this.usersByChangedBy = usersByChangedBy;
		this.person = person;
		this.patientId = patientId;
		this.externalId1 = externalId1;
		this.externalId2 = externalId2;
		this.bloodGroup = bloodGroup;
		this.weight = weight;
		this.weightUnit = weightUnit;
		this.height = height;
		this.heightUnit = heightUnit;
		this.dateClosed = dateClosed;
		this.reasonClosed = reasonClosed;
		this.died = died;
		this.dateDied = dateDied;
		this.deathCause = deathCause;
		this.comments = comments;
		this.dateCreated = dateCreated;
		this.dateChanged = dateChanged;
		this.uuid = uuid;
	}

	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "person_id", unique = true, nullable = false)
	public int getPersonId() {
		return this.personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by")
	public UsersClient getUsersByCreatedBy() {
		return this.usersByCreatedBy;
	}

	public void setUsersByCreatedBy(UsersClient usersByCreatedBy) {
		this.usersByCreatedBy = usersByCreatedBy;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "closed_by")
	public UsersClient getUsersByClosedBy() {
		return this.usersByClosedBy;
	}

	public void setUsersByClosedBy(UsersClient usersByClosedBy) {
		this.usersByClosedBy = usersByClosedBy;
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

	@OneToOne(fetch = FetchType.EAGER)
	@PrimaryKeyJoinColumn
	public PersonClient getPerson() {
		return this.person;
	}

	public void setPerson(PersonClient person) {
		this.person = person;
	}

	@Column(name = "patient_id", unique = true, length = 20)
	public String getPatientId() {
		return this.patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	@Column(name = "external_id1", length = 20)
	public String getExternalId1() {
		return this.externalId1;
	}

	public void setExternalId1(String externalId1) {
		this.externalId1 = externalId1;
	}

	@Column(name = "external_id2", length = 20)
	public String getExternalId2() {
		return this.externalId2;
	}

	public void setExternalId2(String externalId2) {
		this.externalId2 = externalId2;
	}

	@Column(name = "blood_group", length = 5)
	public String getBloodGroup() {
		return this.bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	@Column(name = "weight", precision = 10, scale = 2)
	public Double getWeight() {
		return this.weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	@Column(name = "weight_unit", length = 5)
	public String getWeightUnit() {
		return this.weightUnit;
	}

	public void setWeightUnit(String weightUnit) {
		this.weightUnit = weightUnit;
	}

	public void setWeight(Double weight, String weightUnit) {
		setWeight(weight);
		setWeightUnit(weightUnit);
	}

	@Column(name = "height", precision = 10, scale = 2)
	public Double getHeight() {
		return this.height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	@Column(name = "height_unit", length = 5)
	public String getHeightUnit() {
		return this.heightUnit;
	}

	public void setHeightUnit(String heightUnit) {
		this.heightUnit = heightUnit;
	}

	public void setHeight(Double height, String heightUnit) {
		setHeight(height);
		setHeightUnit(heightUnit);
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_closed", length = 19)
	public Date getDateClosed() {
		return this.dateClosed;
	}

	public void setDateClosed(Date dateClosed) {
		this.dateClosed = dateClosed;
	}

	@Column(name = "reason_closed")
	public String getReasonClosed() {
		return this.reasonClosed;
	}

	public void setReasonClosed(String reasonClosed) {
		this.reasonClosed = reasonClosed;
	}

	@Column(name = "died")
	public Boolean getDied() {
		return this.died;
	}

	public void setDied(Boolean died) {
		this.died = died;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_died", length = 19)
	public Date getDateDied() {
		return this.dateDied;
	}

	public void setDateDied(Date dateDied) {
		this.dateDied = dateDied;
	}

	@Column(name = "death_cause")
	public String getDeathCause() {
		return this.deathCause;
	}

	public void setDeathCause(String deathCause) {
		this.deathCause = deathCause;
	}

	@Column(name = "comments")
	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
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
		return personId + ", " + patientId + ", " + externalId1 + ", "
				+ externalId2 + ", " + bloodGroup + ", " + weight + ", "
				+ weightUnit + ", " + height + ", " + heightUnit + ", "
				+ dateClosed + ", " + reasonClosed + ", " + died + ", "
				+ dateDied + ", " + deathCause + ", " + comments + ", "
				+ dateCreated + ", " + dateChanged + ", " + uuid;
	}
}
