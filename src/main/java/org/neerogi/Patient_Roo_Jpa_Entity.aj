// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.neerogi.Patient;

privileged aspect Patient_Roo_Jpa_Entity {
    
    declare @type: Patient: @Entity;
    
    declare @type: Patient: @Table(name = "patient");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id", columnDefinition = "INT")
    private Integer Patient.id;
    
    public Integer Patient.getId() {
        return this.id;
    }
    
    public void Patient.setId(Integer id) {
        this.id = id;
    }
    
}
