% © Dmytro Popov

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_log)).
:- use_module(library(http/json_convert)).

% carrer_advices.pl
:- use_module(career_advices).

find_carrers(_{skills: Skills, interests: Interests}, _{professions: Professions}) :-
    json_array_to_prolog(Skills, ParsedSkills),
    json_array_to_prolog(Interests, ParsedInterests),
    sort(ParsedSkills, SortedSkills),
    sort(ParsedInterests, SortedInterests),
    findall(Advice, career_advice(SortedSkills, SortedInterests, Advice), Professions).

json_array_to_prolog(Array, Atoms) :-
    maplist(atom_string, Atoms, Array).

handle_career_advice_request(Request) :-
    http_read_json_dict(Request, Json),
    find_carrers(Json, RecommendedCareers),
    reply_json_dict(RecommendedCareers).

handle_all_options_request(_Request) :-
    all_skills(Skills),
    all_interests(Interests),
    reply_json_dict(json([
        skills=Skills,
        interests=Interests
    ])).

server(IP, Port) :-
    write(IP),
    % add handlers
    http_handler('/careers', handle_career_advice_request, [methods([post])]),
    http_handler('/options', handle_all_options_request, []),
    % start server
    http_server(http_dispatch, [port(IP:Port)]).

