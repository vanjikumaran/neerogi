// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.neerogi.domain.ProcedureTreatment;
import org.neerogi.domain.ProcedureTreatmentDataOnDemand;
import org.neerogi.domain.Treatment;
import org.neerogi.domain.TreatmentDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ProcedureTreatmentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProcedureTreatmentDataOnDemand: @Component;
    
    private Random ProcedureTreatmentDataOnDemand.rnd = new SecureRandom();
    
    private List<ProcedureTreatment> ProcedureTreatmentDataOnDemand.data;
    
    @Autowired
    TreatmentDataOnDemand ProcedureTreatmentDataOnDemand.treatmentDataOnDemand;
    
    public ProcedureTreatment ProcedureTreatmentDataOnDemand.getNewTransientProcedureTreatment(int index) {
        ProcedureTreatment obj = new ProcedureTreatment();
        setDescription(obj, index);
        setDuration(obj, index);
        setName(obj, index);
        setTreatmentId(obj, index);
        return obj;
    }
    
    public void ProcedureTreatmentDataOnDemand.setDescription(ProcedureTreatment obj, int index) {
        String description = "description_" + index;
        if (description.length() > 1000) {
            description = description.substring(0, 1000);
        }
        obj.setDescription(description);
    }
    
    public void ProcedureTreatmentDataOnDemand.setDuration(ProcedureTreatment obj, int index) {
        String duration = "duration_" + index;
        if (duration.length() > 1000) {
            duration = duration.substring(0, 1000);
        }
        obj.setDuration(duration);
    }
    
    public void ProcedureTreatmentDataOnDemand.setName(ProcedureTreatment obj, int index) {
        String name = "name_" + index;
        if (name.length() > 1000) {
            name = name.substring(0, 1000);
        }
        obj.setName(name);
    }
    
    public void ProcedureTreatmentDataOnDemand.setTreatmentId(ProcedureTreatment obj, int index) {
        Treatment treatmentId = treatmentDataOnDemand.getRandomTreatment();
        obj.setTreatmentId(treatmentId);
    }
    
    public ProcedureTreatment ProcedureTreatmentDataOnDemand.getSpecificProcedureTreatment(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ProcedureTreatment obj = data.get(index);
        Integer id = obj.getId();
        return ProcedureTreatment.findProcedureTreatment(id);
    }
    
    public ProcedureTreatment ProcedureTreatmentDataOnDemand.getRandomProcedureTreatment() {
        init();
        ProcedureTreatment obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return ProcedureTreatment.findProcedureTreatment(id);
    }
    
    public boolean ProcedureTreatmentDataOnDemand.modifyProcedureTreatment(ProcedureTreatment obj) {
        return false;
    }
    
    public void ProcedureTreatmentDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ProcedureTreatment.findProcedureTreatmentEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ProcedureTreatment' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ProcedureTreatment>();
        for (int i = 0; i < 10; i++) {
            ProcedureTreatment obj = getNewTransientProcedureTreatment(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}