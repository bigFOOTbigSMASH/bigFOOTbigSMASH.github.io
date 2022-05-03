# MECA 482-01 
  
##  Furuta Pendulum Project
  
####  By: William Jochum, Alex Lawhon, Brendan Ruddy, Ceara Sobecki, Anthony Van Boekel
-----------------------------------------------------------------------------------------
## Table of Contents
- [1. Introduction](#1-Introduction)
- [2. Control_System_Design](#2-Control_System_Design)
- [3. Mathmatical_Modeling](#3-Mathmatical_Modeling)
- [4. Simulation](#4-Simulation)
- [5. Presentation](#5-Presentation)
- [6. Refrences](#6-Refrences)

-----------------------------------------------------------------------------------------
## 1. Introduction

The inertia wheel pendulum(IWP) was examined for this report. An IWP is a mechanism that utilizes an actuator to rotate a reaction wheel to stabilize a pendulum in an upright position. This is an electromechanical system that uses the wheel as a mass that creates a torque and causes a pendulum to react by rotating. The IWP uses this reaction to balance the system in a vertical position. This report will focus on designing an inertia wheel pendulum system to be used as a desktop toy. This will be achieved by following the design requirements shown below.

<p align = "center">
  <img src = "Images/Capabilities Database.PNG" style="margin:10px 10px">
</p>

-----------------------------------------------------------------------------------------
## 2. Control_System_Design

Operational viewpoint diagrams are vital to the design of a system. These diagrams display how all the physical components of the system are put together. This allows us to view exactly where sensors, motors, and other components can be placed to be able to drive the system. Below is the operational viewpoint diagram of this inertia wheel pendulum system. Here it is shown that two rotational sensors are needed, one to keep track of the arm’s position, and one that is used to gain rotational information of the reaction wheel. Both these are necessary, as the data on the arm is needed to know which position it is in, and the data on the reaction wheel is needed to know how much of a reaction force is being imparted by the motor. A counter weight was also deemed necessary. As this is a desk toy, it cannot be rigidly attached by the base, so a counterweight will provide the necessary counterbalance to keep the system upright. This counterweight could be composed of the controller, HMI, and power source, as well as any necessary extra added weights.
<p align = "center">
  <img src = "Images/Mech_482_Diagrams-Operational Viewpoint Diagram.drawio.png" style="margin:10px 10px">
</p>

To determine the dataflow of the system a logical/functional diagram is employed. This diagram shows how data interacts within this system, whether that be electrical data, or physical positional data. Shown below is the logical/functional diagram of this system. Here it is clearer to see the control loops of the system. The reaction wheel control loop, enclosed in the blue dotted line, shows how the controller can change the voltage of  the motor, and use the positional change detected by the sensor to update its voltage command to the motor. This will let the controller accurately adjust the reaction force the reaction wheel provides on the arm. The logical/functional diagram also gives insight into what kind of power sources are needed for the system. With this system it can be seen that a high voltage power source is needed for the motor. There will also need to be a lower power source for the system. In this case it is provided by a voltage step down of the high voltage battery source, to provide power to the sensors and controller. By having both a logical/functional and operational viewpoint diagram created there is a much deeper understanding of exactly how to model the system.
<p align = "center">
  <img src = "Images/Mech_482_Diagrams-Logical Functional Diagram.drawio.png" style="margin:10px 10px">
</p>

-----------------------------------------------------------------------------------------
## 3. Mathmatical_Modeling

The model for the inertia pendulum was derived using the lagrangian method. For this method the total kinetic and potential energy of the arm and wheel is needed, because this system has two degrees of freedom. After taking the partial derivatives of the lagrangian, the state-space functions are determined. This model defines the open-loop system for the inertia pendulum. In order to close the system, feedback is required. The state vector is returned to the input after multiplying by a constant. This constant can be determined after deciding the characteristics of the system and using the place function within Matlab. This can all be seen in the [code](MECA_482_Project_Code.m) written to describe the inertia pendulum. In Hernandez-Guzman et. al [1], the derivation of the mathematical model is described in greater detail and provides clarification for each step.

-----------------------------------------------------------------------------------------
## 4. Simulation

The simulation of the system is based on the closed-loop system, as the open system would have no feedback and, therefore, no corrective action. The diagram that shows the response of the system was created using the function lsim in Matlab. Within the diagram  To:Out(1)  is the angle relative to the vertical axis, To:Out(2) is the angular velocity of the arm, and To:Out(3) is the angular velocity of the wheel. Because the relative angle of the wheel does not have a direct effect on the system, it can be omitted from the diagram. The system performs correctly based on the defined characteristics. The settling time is approximately a second, with the percent overshoot equating to approximately fifty percent. These characteristics were derived from our capabilities database, which define the requirements of the system to oscillate multiple times.
<p align = "center">
  <img src = "Images/Matlab Simulation Results.png" style="margin:10px 10px">
</p>

-----------------------------------------------------------------------------------------
## 5. Presentation

Our presentation can be viewed <a href="https://cdmintz.github.io/MECA-482-Inertial-Wheel-Pendulum/#pres">here</a>.

-----------------------------------------------------------------------------------------
## 6. Refrences
 
 [1] Hernandez-Guzman, V. M., & Silva-Ortizoga, R. (2019). Chapter 16. In Automatic Control with Experiments (pp. 921–950). essay, Springer.
