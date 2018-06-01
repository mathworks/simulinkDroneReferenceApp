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
    float wpPos[3];     /// Lat lon in degrees, H in m ASL
    uint8_t wpType;     /// Waypoint Type, so far only 1 is used
    float wpMetaData;   /// Reserved for later
} waypoint;

/**
* @brief Ground Stattion Commands data structure
*/
typedef struct {
    float U_c;              /// Airspeed command
    float h_c_midLevel;     /// Height command - mid level commands
    float psiDot_c_midLevel;/// Turn rate command - mid level commands
    uint8_t RTB;            /// Return to base flag
    uint8_t followMobile;   /// Follow Mobile GS flag;
    uint8_t isManualModeOn; /// Is the AP in manual or auto?
    uint8_t guidanceMode;   /// Guidance Model for AP 
    uint8_t viewPointIdx;   /// Waypoint to look at when in orbit mode
    float MobileLocation[3]; /// Lat, Lon, H of mobile GS.
} gsCommandsBus;

/**
* @brief Configuration parameters data structure
*/
typedef struct {
    float T_star;               /// Optimal turn value
    float turnLead;             /// Turn lead time
    float airspeedHoldPID[3];   /// Airspeed Hold PID values
    float dEFeedForward;        /// dE Feed Forward term
    float he2ThPID[3];          /// Height Error to throttle PID values
    float th2dTPID[3];          /// Pitch to dT PID values
    float dTFeedForward;        /// dT Feed Forward term
    float rollControlPID[3];    /// Roll Control PID values
    float yawDamperPID[3];      /// Yaw Damper PID values
} apConfigParamsBus;

/**
* @brief GPS data structure used to hold the five basic data
*/
typedef struct {
    float gps_latLon[2];    /// Lat Lon in degrees
    float gps_h;            /// Height
    float gps_cog;          /// Course Over Ground
    float gps_sog;          /// Speed Over Ground
    uint8_t gps_fix;        /// Fix Type
} gpsReading;

/**
* @brief Main data structure used to report the Autopilot status
*/
typedef struct {
    float   Ab[3];      /// Accelration in Body Frame (m/s^2)
    float   G[3];       /// Gyros (rad/sec)
    float   Euler[3];   /// Euler Angles (rad)
    float   ias;        /// Indicated air speed (m/s)
    float   baro;       /// Barometric Pressure (Pa)
    float   Xe[3];      /// LTP UAV Location (m)
    float   Ve[3];      /// UAV Inertial Velocity (m/s) 
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
    float elevatorCmd;  /// Elevator Cmd in Radians
    float throttleCmd;  /// Throttle Cmd in % 0-1
    float aileronCmd;   /// Aileron Cmd in Radians
    float rudderCmd;    /// Rudder Cmd in Radians
    float flapCmd;      /// Flap Cmd in Radians
} ctrlCmdsBus;

#endif
