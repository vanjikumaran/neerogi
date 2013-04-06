// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.neerogi.domain.MedicalConditionSubType;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MedicalConditionSubType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager MedicalConditionSubType.entityManager;
    
    public static final EntityManager MedicalConditionSubType.entityManager() {
        EntityManager em = new MedicalConditionSubType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long MedicalConditionSubType.countMedicalConditionSubTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM MedicalConditionSubType o", Long.class).getSingleResult();
    }
    
    public static List<MedicalConditionSubType> MedicalConditionSubType.findAllMedicalConditionSubTypes() {
        return entityManager().createQuery("SELECT o FROM MedicalConditionSubType o", MedicalConditionSubType.class).getResultList();
    }
    
    public static MedicalConditionSubType MedicalConditionSubType.findMedicalConditionSubType(Integer id) {
        if (id == null) return null;
        return entityManager().find(MedicalConditionSubType.class, id);
    }
    
    public static List<MedicalConditionSubType> MedicalConditionSubType.findMedicalConditionSubTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM MedicalConditionSubType o", MedicalConditionSubType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void MedicalConditionSubType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void MedicalConditionSubType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            MedicalConditionSubType attached = MedicalConditionSubType.findMedicalConditionSubType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void MedicalConditionSubType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void MedicalConditionSubType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public MedicalConditionSubType MedicalConditionSubType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        MedicalConditionSubType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
