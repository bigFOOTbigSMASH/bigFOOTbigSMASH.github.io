![GitHub Light](https://github.com/github-light.png#gh-dark-mode-only)
# MECA 482-01 
  
##  Furuta Pendulum Project
  
####  By: William Jochum, Alex Lawhon, Brendan Ruddy, Ceara Sobecki, Anthony Van Boekel
-----------------------------------------------------------------------------------------
## Table of Contents
- [1. Introduction](#1-Introduction)
- [2. Control System Design](#2-Control_System_Design)
- [3. Mathmatical Modeling](#3-Mathmatical_Modeling)
- [4. Simulation](#4-Simulation)
- [5. Presentation](#5-Presentation)
- [6. Refrences](#6-Refrences)

-----------------------------------------------------------------------------------------
## 1. Introduction

A classic control system example, that demonstrates the understanding for nonlinear controls laws, is the 
Furuta Pendulum.
The format used, to display this project, was CoppeliaSim and Matlab. The pendulum system which rotates 
freely on a vertical plane, is attached to a driven arm that rotates in a horizontal plane. When the 
pendulum is placed in the upright position, the actuator rotating the supporting arm will keep it 
balanced and upright. 


<p align = "center">
  <img src = "Images/Capabilities_Database.PNG" style="margin:10px 10px">
</p>

-----------------------------------------------------------------------------------------
## 2. Control_System_Design

The logical/function viewpoint follows the data through the system. The controller sends a signal to the 
driver which amplifies the voltage to provide the necessary power to drive the actuator. The actuator 
represents the motor which changes the lever arm’s position. The angle encoder tracks position of the 
pendulum and sends information back to the controller which interprets the data and repeats the process 
to obtain the necessary position to balance the pendulum in the upright position. Low power source 
supplies voltage to the controller. High power source supplies the voltage necessary to drive the 
actuator.


<p align = "center">
  <img src = "Images/Logical.png" style="margin:10px 10px">
</p>

Operational Viewpoint provides a visual representation of a system and describes how the physical 
components of the system interact with one another. The image below shows the operational viewpoint of 
the furuta pendulum. The motor controls the pendulum arm which supports the freely rotating pendulum. 
Motor, arm, encoder, and pendulum are supported by the chassis.

<p align = "center">
  <img src = "Images/Operational.png" style="margin:10px 10px">
</p>

-----------------------------------------------------------------------------------------
## 3. Mathmatical_Modeling

insert text here
 [code](Meca482_FurutaProject_Group3_Matlab.m) 
 insert text here
 

-----------------------------------------------------------------------------------------
## 4. Simulation

The virtual reality environment program Coppelia Sim allows the user to model in 3D space and simulate 
that model in real life dynamic simulation. The model can be programmed using Python or a proprietary 
programming language “lua”. Lua is a similar language to MATLAB that utilizes conditional statements to 
execute various movements in the 3D space. The program can also be linked to MATLAB to allow users to 
utilize MATLAB’s language, which allows for a broader spectrum of users. 

The user can connect the two programs using a specific set of  files that are included with the download 
of Coppelia Sim. Within the Coppelia Sim program files, there are four files (remApi.m, remoteApi.dll, 
remoteApiProto.m, simpleTest.m) that must be grouped together in one folder in order to connect MATLAB 
and Coppelia Sim. These [files](https://github.com/bigFOOTbigSMASH/bigFOOTbigSMASH.github.io/tree/main/
Files) are listed and can be downloaded from the “Files” section. Once these files are collected, the 
sampleTest.m file must be opened in MATLAB and the instructions listed must be followed in order to 
guarantee a successful connection of the two programs. 

Once a successful connection is achieved, the lua code that will execute the motion of the pendulum 
inside Coppelia Sim, must be added to the designated block within the MATLAB program. However, after 
extensive research, utilizing numerous online resources, textbooks and Coppelia Sim forums, creating a 
complex lua program such as this was unsuccessful. Gaining a full understanding of the required language 
was not feasible in the allotted time period. Therefore, the results of the simulation were not 
successful in achieving a self balanced pendulum.

<p align = "center">
  <img src = "Images/FBD_Furuta.png" style="margin:10px 10px">
</p>

Although the simulation was unsuccessful, the parameters were acquired and the dynamics of the system 
that were derived. Illustrated in figure above, the pendulum is swung about the y-axis creating the angle 
θ_1. This angle is interpreted by the origin joint, and depending on the value of θ_1, the joint rotates 
in order to keep θ_1 within specified values. 


<p align = "center">
  <img src = "Images/Matlab_results.png" style="margin:10px 10px">
</p>
-----------------------------------------------------------------------------------------
## 5. Presentation

<p align = "center">
  <iframe src="presentation/Furuta Pendulum Sim.mp4" width="640" height="480" allow="autoplay"> </iframe>
</p>
-----------------------------------------------------------------------------------------
## 6. Refrences
 
Regular API reference. regular API reference. (n.d.). Retrieved May 9, 2022, from https://www.
coppeliarobotics.com/helpFiles/en/apiFunctions.htm 

Hernández-Guzmán Victor Manuel., & Silva-Ortigoza Ramón. (2019). Automatic control with experiments. 
Springer International Publishing. 
