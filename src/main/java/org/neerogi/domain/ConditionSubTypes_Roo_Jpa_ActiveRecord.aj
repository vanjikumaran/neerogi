// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.neerogi.domain.ConditionSubTypes;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ConditionSubTypes_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ConditionSubTypes.entityManager;
    
    public static final EntityManager ConditionSubTypes.entityManager() {
        EntityManager em = new ConditionSubTypes().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ConditionSubTypes.countConditionSubTypeses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ConditionSubTypes o", Long.class).getSingleResult();
    }
    
    public static List<ConditionSubTypes> ConditionSubTypes.findAllConditionSubTypeses() {
        return entityManager().createQuery("SELECT o FROM ConditionSubTypes o", ConditionSubTypes.class).getResultList();
    }
    
    public static ConditionSubTypes ConditionSubTypes.findConditionSubTypes(Integer id) {
        if (id == null) return null;
        return entityManager().find(ConditionSubTypes.class, id);
    }
    
    public static List<ConditionSubTypes> ConditionSubTypes.findConditionSubTypesEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ConditionSubTypes o", ConditionSubTypes.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ConditionSubTypes.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ConditionSubTypes.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ConditionSubTypes attached = ConditionSubTypes.findConditionSubTypes(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ConditionSubTypes.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ConditionSubTypes.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ConditionSubTypes ConditionSubTypes.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ConditionSubTypes merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}