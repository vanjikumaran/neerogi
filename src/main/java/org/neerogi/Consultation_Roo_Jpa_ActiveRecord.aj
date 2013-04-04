// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.neerogi.Consultation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Consultation_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Consultation.entityManager;
    
    public static final EntityManager Consultation.entityManager() {
        EntityManager em = new Consultation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Consultation.countConsultations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Consultation o", Long.class).getSingleResult();
    }
    
    public static List<Consultation> Consultation.findAllConsultations() {
        return entityManager().createQuery("SELECT o FROM Consultation o", Consultation.class).getResultList();
    }
    
    public static Consultation Consultation.findConsultation(Integer id) {
        if (id == null) return null;
        return entityManager().find(Consultation.class, id);
    }
    
    public static List<Consultation> Consultation.findConsultationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Consultation o", Consultation.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Consultation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Consultation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Consultation attached = Consultation.findConsultation(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Consultation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Consultation.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Consultation Consultation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Consultation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
