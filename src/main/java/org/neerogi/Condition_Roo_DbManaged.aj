// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi;

import java.util.Calendar;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.neerogi.Condition;
import org.neerogi.ConditionSubTypes;
import org.neerogi.FollowUp;
import org.neerogi.Investigation;
import org.neerogi.Patient;
import org.neerogi.Treatment;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Condition_Roo_DbManaged {
    
    @OneToMany(mappedBy = "conditionId")
    private Set<FollowUp> Condition.followUps;
    
    @OneToMany(mappedBy = "conditionId")
    private Set<Investigation> Condition.investigations;
    
    @OneToMany(mappedBy = "conditionId")
    private Set<Treatment> Condition.treatments;
    
    @ManyToOne
    @JoinColumn(name = "ConditionubType_Id", referencedColumnName = "Id")
    private ConditionSubTypes Condition.conditionubTypeId;
    
    @ManyToOne
    @JoinColumn(name = "Patient_Id", referencedColumnName = "Id", nullable = false)
    private Patient Condition.patientId;
    
    @Column(name = "ConsultationId", columnDefinition = "INT")
    private Integer Condition.consultationId;
    
    @Column(name = "ConditionType", columnDefinition = "VARCHAR", length = 1000)
    @NotNull
    private String Condition.conditionType;
    
    @Column(name = "Date", columnDefinition = "DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Condition.date;
    
    @Column(name = "Name", columnDefinition = "VARCHAR", length = 1000)
    @NotNull
    private String Condition.name;
    
    @Column(name = "Description", columnDefinition = "VARCHAR", length = 1000)
    private String Condition.description;
    
    @Column(name = "FollowUp", columnDefinition = "BIT")
    @NotNull
    private boolean Condition.followUp;
    
    public Set<FollowUp> Condition.getFollowUps() {
        return followUps;
    }
    
    public void Condition.setFollowUps(Set<FollowUp> followUps) {
        this.followUps = followUps;
    }
    
    public Set<Investigation> Condition.getInvestigations() {
        return investigations;
    }
    
    public void Condition.setInvestigations(Set<Investigation> investigations) {
        this.investigations = investigations;
    }
    
    public Set<Treatment> Condition.getTreatments() {
        return treatments;
    }
    
    public void Condition.setTreatments(Set<Treatment> treatments) {
        this.treatments = treatments;
    }
    
    public ConditionSubTypes Condition.getConditionubTypeId() {
        return conditionubTypeId;
    }
    
    public void Condition.setConditionubTypeId(ConditionSubTypes conditionubTypeId) {
        this.conditionubTypeId = conditionubTypeId;
    }
    
    public Patient Condition.getPatientId() {
        return patientId;
    }
    
    public void Condition.setPatientId(Patient patientId) {
        this.patientId = patientId;
    }
    
    public Integer Condition.getConsultationId() {
        return consultationId;
    }
    
    public void Condition.setConsultationId(Integer consultationId) {
        this.consultationId = consultationId;
    }
    
    public String Condition.getConditionType() {
        return conditionType;
    }
    
    public void Condition.setConditionType(String conditionType) {
        this.conditionType = conditionType;
    }
    
    public Calendar Condition.getDate() {
        return date;
    }
    
    public void Condition.setDate(Calendar date) {
        this.date = date;
    }
    
    public String Condition.getName() {
        return name;
    }
    
    public void Condition.setName(String name) {
        this.name = name;
    }
    
    public String Condition.getDescription() {
        return description;
    }
    
    public void Condition.setDescription(String description) {
        this.description = description;
    }
    
    public boolean Condition.isFollowUp() {
        return followUp;
    }
    
    public void Condition.setFollowUp(boolean followUp) {
        this.followUp = followUp;
    }
    
}