<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    
    <!-- Root template -->
    <xsl:template match="/">
        <xsl:text>{</xsl:text>
        <xsl:apply-templates select="HealthcareProvider"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <!-- HealthcareProvider template -->
    <xsl:template match="HealthcareProvider">
        <xsl:text>"providerID": "</xsl:text>
        <xsl:value-of select="@providerID"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"established": </xsl:text>
        <xsl:value-of select="@established"/>
        <xsl:text>,</xsl:text>
        <xsl:text>"accredited": </xsl:text>
        <xsl:value-of select="@accredited"/>
        <xsl:text>,</xsl:text>
        
        <!-- Contact Information -->
        <xsl:text>"contactInformation": {</xsl:text>
        <xsl:apply-templates select="ContactInformation"/>
        <xsl:text>},</xsl:text>
        
        <!-- Departments -->
        <xsl:text>"departments": [</xsl:text>
        <xsl:apply-templates select="Departments/Department">
            <xsl:sort select="@name"/>
        </xsl:apply-templates>
        <xsl:text>],</xsl:text>
        
        <!-- Medical Staff -->
        <xsl:text>"medicalStaff": [</xsl:text>
        <xsl:apply-templates select="MedicalStaff/Physician"/>
        <xsl:text>],</xsl:text>
        
        <!-- Facilities -->
        <xsl:text>"facilities": [</xsl:text>
        <xsl:apply-templates select="Facilities/Facility"/>
        <xsl:text>],</xsl:text>
        
        <!-- Insurance Accepted -->
        <xsl:text>"insuranceAccepted": [</xsl:text>
        <xsl:apply-templates select="InsuranceAccepted/Insurance"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <!-- Contact Information template -->
    <xsl:template match="ContactInformation">
        <xsl:text>"address": {</xsl:text>
        <xsl:apply-templates select="Address"/>
        <xsl:text>},</xsl:text>
        
        <xsl:text>"phones": [</xsl:text>
        <xsl:apply-templates select="Phone"/>
        <xsl:text>],</xsl:text>
        
        <xsl:text>"emails": [</xsl:text>
        <xsl:apply-templates select="Email"/>
        <xsl:text>],</xsl:text>
        
        <xsl:text>"website": "</xsl:text>
        <xsl:value-of select="Website"/>
        <xsl:text>",</xsl:text>
        
        <xsl:text>"socialMedia": [</xsl:text>
        <xsl:apply-templates select="SocialMedia/Platform"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <!-- Address template -->
    <xsl:template match="Address">
        <xsl:text>"type": "</xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"street": "</xsl:text>
        <xsl:value-of select="Street"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"city": "</xsl:text>
        <xsl:value-of select="City"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"state": "</xsl:text>
        <xsl:value-of select="State"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"zipCode": "</xsl:text>
        <xsl:value-of select="ZipCode"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"country": "</xsl:text>
        <xsl:value-of select="Country"/>
        <xsl:text>"</xsl:text>
    </xsl:template>
    
    <!-- Phone template -->
    <xsl:template match="Phone">
        <xsl:text>{</xsl:text>
        <xsl:text>"type": "</xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"number": "</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>"</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Email template -->
    <xsl:template match="Email">
        <xsl:text>{</xsl:text>
        <xsl:text>"type": "</xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"address": "</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>"</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Social Media Platform template -->
    <xsl:template match="Platform">
        <xsl:text>{</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"url": "</xsl:text>
        <xsl:value-of select="@url"/>
        <xsl:text>"</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Department template -->
    <xsl:template match="Department">
        <xsl:text>{</xsl:text>
        <xsl:text>"id": "</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"floor": </xsl:text>
        <xsl:value-of select="@floor"/>
        <xsl:text>,</xsl:text>
        <xsl:text>"description": "</xsl:text>
        <xsl:value-of select="Description"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"headPhysician": {</xsl:text>
        <xsl:text>"id": "</xsl:text>
        <xsl:value-of select="HeadPhysician/@id"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="HeadPhysician"/>
        <xsl:text>"</xsl:text>
        <xsl:text>},</xsl:text>
        
        <!-- Services -->
        <xsl:text>"services": [</xsl:text>
        <xsl:choose>
            <xsl:when test="Services/Service">
                <xsl:apply-templates select="Services/Service"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text></xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>]</xsl:text>
        
        <!-- Child Friendly Amenities (if present) -->
        <xsl:if test="ChildFriendlyAmenities">
            <xsl:text>,</xsl:text>
            <xsl:text>"childFriendlyAmenities": [</xsl:text>
            <xsl:apply-templates select="ChildFriendlyAmenities/Amenity"/>
            <xsl:text>]</xsl:text>
        </xsl:if>
        
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Service template -->
    <xsl:template match="Service">
        <xsl:text>{</xsl:text>
        <xsl:text>"id": "</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"description": "</xsl:text>
        <xsl:value-of select="Description"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"duration": {</xsl:text>
        <xsl:text>"value": </xsl:text>
        <xsl:value-of select="Duration"/>
        <xsl:text>,</xsl:text>
        <xsl:text>"unit": "</xsl:text>
        <xsl:value-of select="Duration/@unit"/>
        <xsl:text>"</xsl:text>
        <xsl:text>},</xsl:text>
        <xsl:text>"cost": {</xsl:text>
        <xsl:text>"amount": </xsl:text>
        <xsl:value-of select="Cost"/>
        <xsl:text>,</xsl:text>
        <xsl:text>"currency": "</xsl:text>
        <xsl:value-of select="Cost/@currency"/>
        <xsl:text>"</xsl:text>
        <xsl:text>},</xsl:text>
        <xsl:text>"requiresReferral": </xsl:text>
        <xsl:value-of select="RequiresReferral"/>
        
        <!-- Equipment (if present) -->
        <xsl:if test="Equipment">
            <xsl:text>,</xsl:text>
            <xsl:text>"equipment": {</xsl:text>
            <xsl:text>"name": "</xsl:text>
            <xsl:value-of select="Equipment/EquipmentName"/>
            <xsl:text>",</xsl:text>
            <xsl:text>"manufacturer": "</xsl:text>
            <xsl:value-of select="Equipment/Manufacturer"/>
            <xsl:text>",</xsl:text>
            <xsl:text>"yearAcquired": </xsl:text>
            <xsl:value-of select="Equipment/YearAcquired"/>
            <xsl:text>}</xsl:text>
        </xsl:if>
        
        <!-- Schedule (if present) -->
        <xsl:if test="Schedule">
            <xsl:text>,</xsl:text>
            <xsl:text>"schedule": {</xsl:text>
            <xsl:text>"days": [</xsl:text>
            <xsl:for-each select="Schedule/Day">
                <xsl:text>"</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>"</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>,</xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:text>],</xsl:text>
            <xsl:text>"timeSlots": [</xsl:text>
            <xsl:for-each select="Schedule/TimeSlot">
                <xsl:text>{</xsl:text>
                <xsl:text>"start": "</xsl:text>
                <xsl:value-of select="StartTime"/>
                <xsl:text>",</xsl:text>
                <xsl:text>"end": "</xsl:text>
                <xsl:value-of select="EndTime"/>
                <xsl:text>"</xsl:text>
                <xsl:text>}</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>,</xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:text>]</xsl:text>
            <xsl:text>}</xsl:text>
        </xsl:if>
        
        <!-- Vaccine Inventory (if present) -->
        <xsl:if test="VaccineInventory">
            <xsl:text>,</xsl:text>
            <xsl:text>"vaccineInventory": [</xsl:text>
            <xsl:apply-templates select="VaccineInventory/Vaccine"/>
            <xsl:text>]</xsl:text>
        </xsl:if>
        
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Vaccine template -->
    <xsl:template match="Vaccine">
        <xsl:text>{</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"manufacturer": "</xsl:text>
        <xsl:value-of select="@manufacturer"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"inStock": </xsl:text>
        <xsl:value-of select="@inStock"/>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Amenity template -->
    <xsl:template match="Amenity">
        <xsl:text>{</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"location": "</xsl:text>
        <xsl:value-of select="@location"/>
        <xsl:text>"</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Physician template -->
    <xsl:template match="Physician">
        <xsl:text>{</xsl:text>
        <xsl:text>"id": "</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"department": "</xsl:text>
        <xsl:value-of select="@department"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"name": {</xsl:text>
        <xsl:text>"first": "</xsl:text>
        <xsl:value-of select="PersonName/First"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"last": "</xsl:text>
        <xsl:value-of select="PersonName/Last"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"title": "</xsl:text>
        <xsl:value-of select="PersonName/Title"/>
        <xsl:text>"</xsl:text>
        <xsl:text>},</xsl:text>
        <xsl:text>"specialty": {</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="Specialty"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"primary": </xsl:text>
        <xsl:value-of select="Specialty/@primary"/>
        <xsl:text>}</xsl:text>
        
        <!-- Subspecialty (if present) -->
        <xsl:if test="Subspecialty">
            <xsl:text>,</xsl:text>
            <xsl:text>"subspecialty": "</xsl:text>
            <xsl:value-of select="Subspecialty"/>
            <xsl:text>"</xsl:text>
        </xsl:if>
        
        <xsl:text>,</xsl:text>
        <xsl:text>"credentials": {</xsl:text>
        <xsl:text>"degrees": [</xsl:text>
        <xsl:apply-templates select="Credentials/Degree"/>
        <xsl:text>],</xsl:text>
        <xsl:text>"boardCertifications": [</xsl:text>
        <xsl:apply-templates select="Credentials/BoardCertification"/>
        <xsl:text>]</xsl:text>
        <xsl:text>},</xsl:text>
        <xsl:text>"yearsOfExperience": </xsl:text>
        <xsl:value-of select="YearsOfExperience"/>
        <xsl:text>,</xsl:text>
        <xsl:text>"languages": [</xsl:text>
        <xsl:apply-templates select="Languages/Language"/>
        <xsl:text>],</xsl:text>
        <xsl:text>"officeHours": [</xsl:text>
        <xsl:apply-templates select="OfficeHours/Day"/>
        <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Degree template -->
    <xsl:template match="Degree">
        <xsl:text>{</xsl:text>
        <xsl:text>"type": "</xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"institution": "</xsl:text>
        <xsl:value-of select="@institution"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"year": </xsl:text>
        <xsl:value-of select="@year"/>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- BoardCertification template -->
    <xsl:template match="BoardCertification">
        <xsl:text>{</xsl:text>
        <xsl:text>"board": "</xsl:text>
        <xsl:value-of select="@board"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"year": </xsl:text>
        <xsl:value-of select="@year"/>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Language template -->
    <xsl:template match="Language">
        <xsl:text>{</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"fluency": "</xsl:text>
        <xsl:value-of select="@fluency"/>
        <xsl:text>"</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Day (Office Hours) template -->
    <xsl:template match="OfficeHours/Day">
        <xsl:text>{</xsl:text>
        <xsl:text>"day": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"startTime": "</xsl:text>
        <xsl:value-of select="StartTime"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"endTime": "</xsl:text>
        <xsl:value-of select="EndTime"/>
        <xsl:text>"</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Facility template -->
    <xsl:template match="Facility">
        <xsl:text>{</xsl:text>
        <xsl:text>"id": "</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"description": "</xsl:text>
        <xsl:value-of select="Description"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"yearBuilt": </xsl:text>
        <xsl:value-of select="YearBuilt"/>
        <xsl:text>,</xsl:text>
        <xsl:text>"squareFootage": {</xsl:text>
        <xsl:text>"value": </xsl:text>
        <xsl:value-of select="SquareFootage"/>
        <xsl:text>,</xsl:text>
        <xsl:text>"unit": "</xsl:text>
        <xsl:value-of select="SquareFootage/@unit"/>
        <xsl:text>"</xsl:text>
        <xsl:text>},</xsl:text>
        <xsl:text>"floors": </xsl:text>
        <xsl:value-of select="Floors"/>
        <xsl:text>,</xsl:text>
        <xsl:text>"features": [</xsl:text>
        <xsl:apply-templates select="Features/Feature"/>
        <xsl:text>],</xsl:text>
        <xsl:text>"rooms": [</xsl:text>
        <xsl:apply-templates select="Rooms/Room"/>
        <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Feature template -->
    <xsl:template match="Feature">
        <xsl:text>{</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"location": "</xsl:text>
        <xsl:value-of select="@location"/>
        <xsl:text>"</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Room template -->
    <xsl:template match="Room">
        <xsl:text>{</xsl:text>
        <xsl:text>"type": "</xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"count": </xsl:text>
        <xsl:value-of select="@count"/>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Insurance template -->
    <xsl:template match="Insurance">
        <xsl:text>{</xsl:text>
        <xsl:text>"name": "</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"type": "</xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"inNetwork": </xsl:text>
        <xsl:value-of select="@inNetwork"/>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet> 