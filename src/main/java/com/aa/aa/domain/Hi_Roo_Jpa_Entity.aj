// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.aa.aa.domain;

import com.aa.aa.domain.Hi;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Hi_Roo_Jpa_Entity {
    
    declare @type: Hi: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Hi.id;
    
    @Version
    @Column(name = "version")
    private Integer Hi.version;
    
    public Long Hi.getId() {
        return this.id;
    }
    
    public void Hi.setId(Long id) {
        this.id = id;
    }
    
    public Integer Hi.getVersion() {
        return this.version;
    }
    
    public void Hi.setVersion(Integer version) {
        this.version = version;
    }
    
}
