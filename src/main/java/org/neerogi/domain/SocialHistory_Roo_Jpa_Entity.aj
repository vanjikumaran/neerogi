// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.neerogi.domain.SocialHistory;

privileged aspect SocialHistory_Roo_Jpa_Entity {
    
    declare @type: SocialHistory: @Entity;
    
    declare @type: SocialHistory: @Table(name = "social_history");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer SocialHistory.id;
    
    public Integer SocialHistory.getId() {
        return this.id;
    }
    
    public void SocialHistory.setId(Integer id) {
        this.id = id;
    }
    
}
