// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.neerogi;

import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.neerogi.SocialHistory;
import org.neerogi.SocialHistoryDataOnDemand;
import org.neerogi.SocialHistoryIntegrationTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SocialHistoryIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SocialHistoryIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SocialHistoryIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SocialHistoryIntegrationTest: @Transactional;
    
    @Autowired
    SocialHistoryDataOnDemand SocialHistoryIntegrationTest.dod;
    
    @Test
    public void SocialHistoryIntegrationTest.testCountSocialHistorys() {
        Assert.assertNotNull("Data on demand for 'SocialHistory' failed to initialize correctly", dod.getRandomSocialHistory());
        long count = SocialHistory.countSocialHistorys();
        Assert.assertTrue("Counter for 'SocialHistory' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SocialHistoryIntegrationTest.testFindSocialHistory() {
        SocialHistory obj = dod.getRandomSocialHistory();
        Assert.assertNotNull("Data on demand for 'SocialHistory' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SocialHistory' failed to provide an identifier", id);
        obj = SocialHistory.findSocialHistory(id);
        Assert.assertNotNull("Find method for 'SocialHistory' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'SocialHistory' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SocialHistoryIntegrationTest.testFindAllSocialHistorys() {
        Assert.assertNotNull("Data on demand for 'SocialHistory' failed to initialize correctly", dod.getRandomSocialHistory());
        long count = SocialHistory.countSocialHistorys();
        Assert.assertTrue("Too expensive to perform a find all test for 'SocialHistory', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<SocialHistory> result = SocialHistory.findAllSocialHistorys();
        Assert.assertNotNull("Find all method for 'SocialHistory' illegally returned null", result);
        Assert.assertTrue("Find all method for 'SocialHistory' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SocialHistoryIntegrationTest.testFindSocialHistoryEntries() {
        Assert.assertNotNull("Data on demand for 'SocialHistory' failed to initialize correctly", dod.getRandomSocialHistory());
        long count = SocialHistory.countSocialHistorys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<SocialHistory> result = SocialHistory.findSocialHistoryEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'SocialHistory' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'SocialHistory' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SocialHistoryIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'SocialHistory' failed to initialize correctly", dod.getRandomSocialHistory());
        SocialHistory obj = dod.getNewTransientSocialHistory(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'SocialHistory' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'SocialHistory' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'SocialHistory' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SocialHistoryIntegrationTest.testRemove() {
        SocialHistory obj = dod.getRandomSocialHistory();
        Assert.assertNotNull("Data on demand for 'SocialHistory' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SocialHistory' failed to provide an identifier", id);
        obj = SocialHistory.findSocialHistory(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'SocialHistory' with identifier '" + id + "'", SocialHistory.findSocialHistory(id));
    }
    
}
