Course Project based on Nonlinear Adaptive Control of Permanent Magnet Synchronous Motor(PMSM)\
There are two parts in this project-
In the first part, all parameters of the motor are known and a desired trajectory of the angular position is to be tracked. The file PMSM_control.m is the MATLAB file to run the code for the first part. The file odefun_proj.m is the dependency.\
In the second part, we have parameters like friction, load torque, rotor inertia and motor constant which are not exactly known, but only an estimate is known. The file PMSM_adaptive_control.m is the MATLAB file to run the code for the second part. The file odefun_adap_proj2.m is the dependency.
