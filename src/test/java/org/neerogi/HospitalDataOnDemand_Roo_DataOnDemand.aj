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
import org.neerogi.Hospital;
import org.neerogi.HospitalDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect HospitalDataOnDemand_Roo_DataOnDemand {
    
    declare @type: HospitalDataOnDemand: @Component;
    
    private Random HospitalDataOnDemand.rnd = new SecureRandom();
    
    private List<Hospital> HospitalDataOnDemand.data;
    
    public Hospital HospitalDataOnDemand.getNewTransientHospital(int index) {
        Hospital obj = new Hospital();
        setAddress(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void HospitalDataOnDemand.setAddress(Hospital obj, int index) {
        String address = "address_" + index;
        if (address.length() > 1000) {
            address = address.substring(0, 1000);
        }
        obj.setAddress(address);
    }
    
    public void HospitalDataOnDemand.setName(Hospital obj, int index) {
        String name = "name_" + index;
        if (name.length() > 1000) {
            name = name.substring(0, 1000);
        }
        obj.setName(name);
    }
    
    public Hospital HospitalDataOnDemand.getSpecificHospital(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Hospital obj = data.get(index);
        Integer id = obj.getId();
        return Hospital.findHospital(id);
    }
    
    public Hospital HospitalDataOnDemand.getRandomHospital() {
        init();
        Hospital obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return Hospital.findHospital(id);
    }
    
    public boolean HospitalDataOnDemand.modifyHospital(Hospital obj) {
        return false;
    }
    
    public void HospitalDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Hospital.findHospitalEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Hospital' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Hospital>();
        for (int i = 0; i < 10; i++) {
            Hospital obj = getNewTransientHospital(i);
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