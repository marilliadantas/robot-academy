*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    FakerLibrary    locale=pt_BR  
# Library    JSONLibrary   
Library    String

Resource    ./variables/variables.robot
Resource    ./keywords/kw_testes.robot
Resource    ./keywords/kw_login.robot
Resource    ./keywords/kw_users.robot
Resource    ./keywords/kw_company.robot
Resource    ./keywords/kw_gerar_massa.robot