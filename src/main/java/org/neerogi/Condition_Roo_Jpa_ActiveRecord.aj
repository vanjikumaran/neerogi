// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.neerogi.Condition;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Condition_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Condition.entityManager;
    
    public static final EntityManager Condition.entityManager() {
        EntityManager em = new Condition().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Condition.countConditions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Condition o", Long.class).getSingleResult();
    }
    
    public static List<Condition> Condition.findAllConditions() {
        return entityManager().createQuery("SELECT o FROM Condition o", Condition.class).getResultList();
    }
    
    public static Condition Condition.findCondition(Integer id) {
        if (id == null) return null;
        return entityManager().find(Condition.class, id);
    }
    
    public static List<Condition> Condition.findConditionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Condition o", Condition.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Condition.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Condition.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Condition attached = Condition.findCondition(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Condition.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Condition.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Condition Condition.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Condition merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
