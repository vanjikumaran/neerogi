// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.neerogi.Consultation;

privileged aspect Consultation_Roo_Jpa_Entity {
    
    declare @type: Consultation: @Entity;
    
    declare @type: Consultation: @Table(name = "consultation");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id", columnDefinition = "INT")
    private Integer Consultation.id;
    
    public Integer Consultation.getId() {
        return this.id;
    }
    
    public void Consultation.setId(Integer id) {
        this.id = id;
    }
    
}