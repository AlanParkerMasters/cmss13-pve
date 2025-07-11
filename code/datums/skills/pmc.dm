/*
----------------------------
Private Military Contractors
----------------------------
*/

//NOTE: Compared to the USCM, PMCs have additional firearms training, construction skills and policing skills

/datum/skills/pmc
	name = "PMC Private"
	skills = list(
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_ENGINEER = SKILL_ENGINEER_TRAINED,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
	)

/datum/skills/pmc/medic
	name = "PMC Medic"
	skills = list(
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_ENGINEER = SKILL_ENGINEER_TRAINED,
		SKILL_MEDICAL = SKILL_MEDICAL_MEDIC,
		SKILL_SURGERY = SKILL_SURGERY_NOVICE,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
	)

/datum/skills/pmc/medic/chem
	name = "PMC Medical Investigator"
	skills = list(
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_ENGINEER = SKILL_ENGINEER_TRAINED,
		SKILL_MEDICAL = SKILL_MEDICAL_MEDIC,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
		SKILL_RESEARCH = SKILL_RESEARCH_TRAINED,
	)

/datum/skills/pmc/smartgunner
	name = "PMC Smartgunner"
	skills = list(
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_ENGINEER = SKILL_ENGINEER_TRAINED,
		SKILL_SPEC_WEAPONS = SKILL_SPEC_SMARTGUN,
		SKILL_ENDURANCE = SKILL_ENDURANCE_TRAINED,
		SKILL_JTAC = SKILL_JTAC_BEGINNER,
	)

/datum/skills/pmc/specialist
	name = "PMC Specialist"
	skills = list(
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_ENGINEER = SKILL_ENGINEER_TRAINED,
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_SPEC_WEAPONS = SKILL_SPEC_ALL,
		SKILL_MELEE_WEAPONS = SKILL_MELEE_TRAINED,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
		SKILL_JTAC = SKILL_JTAC_BEGINNER,
	)

/datum/skills/pmc/SL
	name = "PMC Leader"
	skills = list(
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_ENGINEER = SKILL_ENGINEER_TRAINED,
		SKILL_CQC = SKILL_CQC_SKILLED,
		SKILL_LEADERSHIP = SKILL_LEAD_TRAINED,
		SKILL_OVERWATCH = SKILL_OVERWATCH_TRAINED,
		SKILL_MEDICAL = SKILL_MEDICAL_TRAINED,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
		SKILL_JTAC = SKILL_JTAC_TRAINED,
	)

/datum/skills/pmc/SL/chem
	name = "PMC Lead Investigator"
	skills = list(
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_ENGINEER = SKILL_ENGINEER_TRAINED,
		SKILL_CQC = SKILL_CQC_SKILLED,
		SKILL_LEADERSHIP = SKILL_LEAD_TRAINED,
		SKILL_OVERWATCH = SKILL_OVERWATCH_TRAINED,
		SKILL_MEDICAL = SKILL_MEDICAL_TRAINED,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
		SKILL_RESEARCH = SKILL_RESEARCH_TRAINED,
		SKILL_JTAC = SKILL_JTAC_TRAINED,
	)

/datum/skills/pmc/tank_crew
	name = "Vehicle Crewman"
	skills = list(
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_ENGINEER = SKILL_ENGINEER_TRAINED,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
		SKILL_LEADERSHIP = SKILL_LEAD_TRAINED,
		SKILL_JTAC = SKILL_JTAC_TRAINED,
		SKILL_VEHICLE = SKILL_VEHICLE_CREWMAN,
		SKILL_POWERLOADER = SKILL_POWERLOADER_MASTER,
	)

/datum/skills/pmc/doctor
	name = "PMC Triage Doctor"
	skills = list(
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_TRAINED,
		SKILL_ENGINEER = SKILL_ENGINEER_NOVICE,
		SKILL_MEDICAL = SKILL_MEDICAL_DOCTOR,
		SKILL_SURGERY = SKILL_SURGERY_EXPERT,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK, //trained in medicine more than combat
		SKILL_CQC = SKILL_CQC_TRAINED
	)

/datum/skills/pmc/engineer
	name = "PMC Corporate Technician"
	skills = list(
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_MASTER,
		SKILL_ENGINEER = SKILL_ENGINEER_MASTER,
		SKILL_MEDICAL = SKILL_MEDICAL_TRAINED,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
		SKILL_JTAC = SKILL_JTAC_TRAINED,
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_POWERLOADER = SKILL_POWERLOADER_MASTER,
	)

/datum/skills/pmc/director
	name = "PMC Site Director"
	skills = list(
		SKILL_FIREARMS = SKILL_FIREARMS_EXPERT,
		SKILL_POLICE = SKILL_POLICE_SKILLED,
		SKILL_FIREMAN = SKILL_FIREMAN_SKILLED,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
		SKILL_ENGINEER = SKILL_ENGINEER_TRAINED,
		SKILL_MEDICAL = SKILL_MEDICAL_MEDIC,
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_LEADERSHIP = SKILL_LEAD_MASTER,
		SKILL_OVERWATCH = SKILL_OVERWATCH_TRAINED,
		SKILL_ENDURANCE = SKILL_ENDURANCE_WEAK,
		SKILL_JTAC = SKILL_JTAC_MASTER,
		SKILL_EXECUTION = SKILL_EXECUTION_TRAINED,
	)
