// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.neerogi.ConditionSubTypes;
import org.neerogi.ConditionSubTypesDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect ConditionSubTypesDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ConditionSubTypesDataOnDemand: @Component;
    
    private Random ConditionSubTypesDataOnDemand.rnd = new SecureRandom();
    
    private List<ConditionSubTypes> ConditionSubTypesDataOnDemand.data;
    
    public ConditionSubTypes ConditionSubTypesDataOnDemand.getNewTransientConditionSubTypes(int index) {
        ConditionSubTypes obj = new ConditionSubTypes();
        setConditionType(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void ConditionSubTypesDataOnDemand.setConditionType(ConditionSubTypes obj, int index) {
        String conditionType = "conditionType_" + index;
        if (conditionType.length() > 1000) {
            conditionType = conditionType.substring(0, 1000);
        }
        obj.setConditionType(conditionType);
    }
    
    public void ConditionSubTypesDataOnDemand.setName(ConditionSubTypes obj, int index) {
        String name = "name_" + index;
        if (name.length() > 1000) {
            name = name.substring(0, 1000);
        }
        obj.setName(name);
    }
    
    public ConditionSubTypes ConditionSubTypesDataOnDemand.getSpecificConditionSubTypes(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ConditionSubTypes obj = data.get(index);
        Integer id = obj.getId();
        return ConditionSubTypes.findConditionSubTypes(id);
    }
    
    public ConditionSubTypes ConditionSubTypesDataOnDemand.getRandomConditionSubTypes() {
        init();
        ConditionSubTypes obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return ConditionSubTypes.findConditionSubTypes(id);
    }
    
    public boolean ConditionSubTypesDataOnDemand.modifyConditionSubTypes(ConditionSubTypes obj) {
        return false;
    }
    
    public void ConditionSubTypesDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ConditionSubTypes.findConditionSubTypesEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ConditionSubTypes' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ConditionSubTypes>();
        for (int i = 0; i < 10; i++) {
            ConditionSubTypes obj = getNewTransientConditionSubTypes(i);
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
