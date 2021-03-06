// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.neerogi.domain.DrugTreatment;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DrugTreatment_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager DrugTreatment.entityManager;
    
    public static final EntityManager DrugTreatment.entityManager() {
        EntityManager em = new DrugTreatment().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long DrugTreatment.countDrugTreatments() {
        return entityManager().createQuery("SELECT COUNT(o) FROM DrugTreatment o", Long.class).getSingleResult();
    }
    
    public static List<DrugTreatment> DrugTreatment.findAllDrugTreatments() {
        return entityManager().createQuery("SELECT o FROM DrugTreatment o", DrugTreatment.class).getResultList();
    }
    
    public static DrugTreatment DrugTreatment.findDrugTreatment(Integer id) {
        if (id == null) return null;
        return entityManager().find(DrugTreatment.class, id);
    }
    
    public static List<DrugTreatment> DrugTreatment.findDrugTreatmentEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM DrugTreatment o", DrugTreatment.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void DrugTreatment.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void DrugTreatment.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            DrugTreatment attached = DrugTreatment.findDrugTreatment(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void DrugTreatment.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void DrugTreatment.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public DrugTreatment DrugTreatment.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        DrugTreatment merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
