/**
* @file mavlinkSend.h
* @brief Simple MAVLink MissionLib helper functions 
* @author Mariano Lizarraga
* @author Collin Spencer
* Copyright 2018 The MathWorks, Inc.
* @date February 2017
*/

#ifndef MAVLINK_SEND_H
#define MAVLINK_SEND_H

#include <stdint.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#if (!defined(_WIN64)) && (defined(__unix__) || defined(__unix) || (defined(__APPLE__) && defined(__MACH__)))
    #include <sys/socket.h>
    #include <sys/types.h>
    #include <netinet/in.h>
    #include <sys/time.h>
    #include <arpa/inet.h>
    #include <unistd.h>
    #include <fcntl.h>
    #define _STAR_NIX_
#elif defined(_WIN64)
    #include <winsock2.h>
    #pragma comment(lib,"Ws2_32.lib") //Winsock Library
    #define _WINDOWS_
    #define inline __inline
#else
    #error "Platform Not Supported"
#endif

#include <stdlib.h>
#include <time.h>
#include <math.h>

#include "mavlink_types.h"

extern mavlink_system_t mavlink_system;

#include "mavlink.h"
#include "interfaceDefinition.h"
#include "mavlink_parameters.h"
#include "mavlink_missionlib_data.h"

/// Maximum lenght of the UDP send data buffer
#define BUFFER_LENGTH 256

/// IP Address of Computer running QGroundControl
#define QGC_ADDRESS "127.0.0.1"

/// UDP Port to Connect to QGroundControl
/// @note It is assumed that local UDP port is QGC_UDP_PORT + 1
#define QGC_UDP_PORT 14550

extern mavlink_pm_storage pm;

void manageMAVLinkConnection(apStatusBus* apStatus, waypoint* uavMission, gsCommandsBus* gsCommands, apConfigParamsBus* apConfigParams);

/**
* @brief This function intializes the UDP sockets to be able to send and receive 
* commands from QGroundControl
*
*/
void initUDPConnection (void);

/**
* @brief This function prepares data in the MAVLink protocol to be 
* sent to QGround Control
*
* @param apStatus Data structure from Simulink with the AP status
* @param dataStream Byte stream containing the serialized MAVLink structures  
* @param validBytesinStream Integer count return value of the amount of bytes in the stream
*
* @warning Make sure you allocate enough space in dataStream!
*/
void prepareAPData(apStatusBus* apStatus, uint8_t* dataStream, uint16_t* validBytesinStream);

/**
* @brief Function used to send data via UDP to QGC
*
* @param dataStream Byte stream containing the serialized MAVLink structures  
* @param validBytesinStream Amount of valid bytes in the stream
*
* @note This function assumes that initUDPConnection has been called
*/
void sendDataToQGC (uint8_t* dataStream, uint16_t validBytesInStream);

/**
* @brief Function to read UDP data from QGC
*
* @param dataStream Byte stream received via UDP containing the serialized MAVLink data structures sent by QGC
* @return           Amount of bytes received by UDP. If negative, an error was produced.
*
* @note the ssize_t type is a POSIX type and thus not portable. This function has been build tu "universally" return an int_16t
*/
int16_t readDataFromQGC(uint8_t* dataStream);

/**
* @brief Close the UDP Socket opened to communicate with QGC.
*
*/
void terminateUDPConnection (void);

/**
 * @brief This function updates all params in a single shot
 * 
 * @param gsCommands  Ground Station commands structure used in the Simulink Model
 * @param apConfigParams Autopilot Configuration parameters structure used in the Simulink Model.
 * 
 */
void updateParams (gsCommandsBus* gsCommands, apConfigParamsBus* apConfigParams);

/** ==========================================
*   Mission Lib Support Functions
*  ==========================================*/

/**
* @brief Auxiliar Function used to send a response by the PM or WP protocols. 
*
* @param msg MAVLink message cotaining the response to be sent out.
*
* @note This function will send data out via the UDP port.
*/
void mavlink_missionlib_send_message(mavlink_message_t* msg);


/**
* @brief Auxiliar Function used to send a console Text Message to QGroundControl. 
*
* @param string String to be printed in the QGC Console.
*
* @note This function will send data out via the UDP port.
*/
void mavlink_missionlib_send_gcs_string(const char* string);

/**
* @brief Auxiliar Function used to send a get the system time. 
*
* @return Returns the OS system time if available, otherwise it returns just a counter.
*
* @note This function only works properly on POSIX systems.
*/
uint64_t mavlink_missionlib_get_system_timestamp(void);

/**
 * @brief Auxiliar Function to Initialize the PM interface with default values
 *
 * @warning DO NOT USE THIS IN FLIGHT!
 */
void mavlink_pm_reset_params(mavlink_pm_storage* pm);

#endif