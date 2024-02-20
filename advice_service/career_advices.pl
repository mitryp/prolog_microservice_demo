% © Dmytro Popov

:- module(career_advices, [career_advice/3, all_interests/1, all_skills/1]).

% Professions and their associated skills and interests
profession_skills(doctor, [biology, chemistry, empathy]).
profession_skills(engineer, [mathematics, problem_solving, creativity]).
profession_skills(teacher, [communication, patience, subject_knowledge]).
profession_skills(artist, [creativity, imagination, attention_to_detail]).
profession_skills(programmer, [coding, problem_solving, attention_to_detail]).
profession_skills(marketing_manager, [communication, market_analysis, creativity]).
profession_skills(psychologist, [listening, empathy, research]).
profession_skills(chef, [culinary_skills, creativity, time_management]).
profession_skills(data_scientist, [statistical_analysis, programming, machine_learning]).
profession_skills(graphic_designer, [creativity, graphic_design_software, attention_to_detail]).
profession_skills(environmental_scientist, [research, data_analysis, environmental_stewardship]).
profession_skills(logistician, [supply_chain_management, analytical_thinking, attention_to_detail]).

profession_interests(doctor, [helping_people, healthcare]).
profession_interests(engineer, [technology, innovation, construction]).
profession_interests(teacher, [education, mentoring, knowledge_transfer]).
profession_interests(artist, [artistic_expression, aesthetics, visual_communication]).
profession_interests(programmer, [technology, coding_challenges, software_development]).
profession_interests(marketing_manager, [branding, advertising, consumer_behavior]).
profession_interests(psychologist, [mental_health, understanding_people, counseling]).
profession_interests(chef, [culinary_arts, experimenting_with_flavors, creating_new_dishes]).
profession_interests(data_scientist, [data_analysis, predictive_modeling, solving_complex_problems]).
profession_interests(graphic_designer, [visual_communication, branding, artistic_expression]).
profession_interests(environmental_scientist, [ecology, conservation, sustainability]).
profession_interests(logistician, [efficiency, optimization, logistics_planning]).

% Rule to determine a good career match based on skills and interests
good_career_match(Career, Skills, Interests) :-
    profession_skills(Career, CareerSkills),
    profession_interests(Career, CareerInterests),
    sort(CareerSkills, SortedCSkills),
    sort(CareerInterests, SortedCInterests),
	ord_intersection(SortedCSkills, Skills, SkillIntersection),
    \+ ord_empty(SkillIntersection),
    ord_intersection(SortedCInterests, Interests, InterestIntersection),
    \+ ord_empty(InterestIntersection).

% Predicate to provide career advice
career_advice(Skills, Interests, RecommendedCareer) :-
    findall(Profession, profession_skills(Profession, _), Careers),
    member(RecommendedCareer, Careers),
    good_career_match(RecommendedCareer, Skills, Interests).

all_interests(Interests) :-
    findall(InterestsList, profession_interests(_, InterestsList), AllInterestsLists),
    flatten(AllInterestsLists, FlattenedList),
    sort(FlattenedList, Interests).

all_skills(Skills) :-
    findall(SkillsList, profession_skills(_, SkillsList), AllSkillsLists),
    flatten(AllSkillsLists, FlattenedList),
    sort(FlattenedList, Skills).
