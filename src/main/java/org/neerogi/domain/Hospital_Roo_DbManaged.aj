// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.domain;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.neerogi.domain.Consultation;
import org.neerogi.domain.Hospital;

privileged aspect Hospital_Roo_DbManaged {
    
    @OneToMany(mappedBy = "hospitalId")
    private Set<Consultation> Hospital.consultations;
    
    @Column(name = "name", length = 1000)
    @NotNull
    private String Hospital.name;
    
    @Column(name = "address", length = 1000)
    private String Hospital.address;
    
    @Column(name = "telephone", length = 45)
    private String Hospital.telephone;
    
    @Column(name = "fax", length = 45)
    private String Hospital.fax;
    
    @Column(name = "email", length = 100)
    private String Hospital.email;
    
    public Set<Consultation> Hospital.getConsultations() {
        return consultations;
    }
    
    public void Hospital.setConsultations(Set<Consultation> consultations) {
        this.consultations = consultations;
    }
    
    public String Hospital.getName() {
        return name;
    }
    
    public void Hospital.setName(String name) {
        this.name = name;
    }
    
    public String Hospital.getAddress() {
        return address;
    }
    
    public void Hospital.setAddress(String address) {
        this.address = address;
    }
    
    public String Hospital.getTelephone() {
        return telephone;
    }
    
    public void Hospital.setTelephone(String telephone) {
        this.telephone = telephone;
    }
    
    public String Hospital.getFax() {
        return fax;
    }
    
    public void Hospital.setFax(String fax) {
        this.fax = fax;
    }
    
    public String Hospital.getEmail() {
        return email;
    }
    
    public void Hospital.setEmail(String email) {
        this.email = email;
    }
    
}