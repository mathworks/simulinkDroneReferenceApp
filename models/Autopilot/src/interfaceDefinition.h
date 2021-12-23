/**
* @file interfaceDefinition.h
* @brief Interface Definition of C Structs to Bus mappings for MBDRI 
* @author Mariano Lizarraga
* @date February 2017
*/

#ifndef INTERFACE_DEFINITION_H
#define INTERFACE_DEFINITION_H

#include <stdint.h>

/**
* @brief Data structure defining a single Waypoint
*/
typedef struct {
    double wpPos[3];     /// Lat lon in degrees, H in m ASL
    uint8_t wpType;     /// Waypoint Type, so far only 1 is used
    double wpMetaData;   /// Reserved for later
} waypoint;

/**
* @brief Ground Stattion Commands data structure
*/
typedef struct {
    double U_c;              /// Airspeed command
    double h_c_midLevel;     /// Height command - mid level commands
    double psiDot_c_midLevel;/// Turn rate command - mid level commands
    uint8_t RTB;            /// Return to base flag
    uint8_t followMobile;   /// Follow Mobile GS flag;
    uint8_t isManualModeOn; /// Is the AP in manual or auto?
    uint8_t guidanceMode;   /// Guidance Model for AP 
    uint8_t viewPointIdx;   /// Waypoint to look at when in orbit mode
    double MobileLocation[3]; /// Lat, Lon, H of mobile GS.
    uint8_t heartbeat;       /// Heartbeat value.
} gsCommandsBus;

/**
* @brief Configuration parameters data structure
*/
typedef struct {
    double T_star;               /// Optimal turn value
    double turnLead;             /// Turn lead time
    double airspeedHoldPID[3];   /// Airspeed Hold PID values
    double dEFeedForward;        /// dE Feed Forward term
    double he2ThPID[3];          /// Height Error to throttle PID values
    double th2dTPID[3];          /// Pitch to dT PID values
    double dTFeedForward;        /// dT Feed Forward term
    double rollControlPID[3];    /// Roll Control PID values
    double yawDamperPID[3];      /// Yaw Damper PID values
} apConfigParamsBus;

/**
* @brief GPS data structure used to hold the five basic data
*/
typedef struct {
    double gps_latLon[2];    /// Lat Lon in degrees
    double gps_h;            /// Height
    double gps_cog;          /// Course Over Ground
    double gps_sog;          /// Speed Over Ground
    uint8_t gps_fix;        /// Fix Type
} gpsReading;

/**
* @brief Main data structure used to report the Autopilot status
*/
typedef struct {
    double   Ab[3];      /// Accelration in Body Frame (m/s^2)
    double   G[3];       /// Gyros (rad/sec)
    double   Euler[3];   /// Euler Angles (rad)
    double   ias;        /// Indicated air speed (m/s)
    double   baro;       /// Barometric Pressure (Pa)
    double   Xe[3];      /// LTP UAV Location (m)
    double   Ve[3];      /// UAV Inertial Velocity (m/s) 
    gpsReading   GPS;        /// GPS Lat, Lon, H, COG, SOG, FixType
    uint8_t guidanceMode;///Current UAV Guidance guidanceMode
    uint8_t currentWp;  /// Current WP being navigated to
} apStatusBus;

typedef struct {
    int16_t Euler_raw[3];       /// Euler Angle measurement raw as read from an IMU sensor
    int16_t Ab_raw[3];          /// Acceleration measurement raw as read from a MEMS SPI Accelerometer
    int16_t G_raw[3];           /// Angular velocity raw as read from a MEMS SPI Gyro
    uint16_t q_raw;             /// Dynamic pressure as read from a Dynamic Pressure Sensor
    uint16_t static_raw;        /// Barometric pressure raw as read of a barometer
    int16_t T_raw;              /// Raw temperature as read of an Analog Thermistor
    int16_t ctrlSurface_PWM[5];    /// Ctrl Surface PWM commands in raw as read by a IC peripheral
}rawSensorDataBus;

typedef struct {
    double elevatorCmd;  /// Elevator Cmd in Radians
    double throttleCmd;  /// Throttle Cmd in % 0-1
    double aileronCmd;   /// Aileron Cmd in Radians
    double rudderCmd;    /// Rudder Cmd in Radians
    double flapCmd;      /// Flap Cmd in Radians
} ctrlCmdsBus;

#endif
