/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.model;

import com.bs.pojo.Regions;
import java.util.List;

/**
 *
 * @author User
 */
public interface RegionsModel {
    public boolean doInsertRegions(Regions regions);
    public boolean doUpdateRegions(Regions regions);
    public boolean doDeleteRegions(Regions regions);
    public Regions findAllRegions();
    public List<Regions> findRegionsById(int regionsId);
    public List<Regions> findAllRegionsList();
}
