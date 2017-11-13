# ┌─┐┬ ┬┬─┐┌─┐┬─┐┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┬ ┬┌─┐┬─┐┬┌─
# ├─┤│ │├┬┘│ │├┬┘├─┤  ├┤ ├┬┘├─┤│││├┤ ││││ │├┬┘├┴┐
# ┴ ┴└─┘┴└─└─┘┴└─┴ ┴  └  ┴└─┴ ┴┴ ┴└─┘└┴┘└─┘┴└─┴ ┴
# A Powerful General Purpose Framework
# More information in: https://aurora-fw.github.io/
#
# Copyright (C) 2017 Aurora Framework, All rights reserved.
#
# This file is part of the Aurora Framework. This framework is free
# software; you can redistribute it and/or modify it under the terms of
# the GNU Lesser General Public License version 3 as published by the
# Free Software Foundation and appearing in the file LICENSE included in
# the packaging of this file. Please review the following information to
# ensure the GNU Lesser General Public License version 3 requirements
# will be met: https://www.gnu.org/licenses/lgpl-3.0.html.

################################################################################
# PortAudio package finder
################################################################################
# Find the native PortAudio includes and library
#
# This module defines
# PortAudio_INCLUDE_DIR, the PortAudio include directories 
# PortAudio_LIBRARIES, link these to use PortAudio
# PortAudio_FOUND, system has PortAudio

if(NOT DEFINED PORTAUDIO_MODULE_LOADED)
set(PORTAUDIO_MODULE_LOADED true)
IF(NOT DEFINED AURORAFW_IS_BUILDING)
	find_package(AuroraFWBuild REQUIRED)
ENDIF()

findpkg_begin(PortAudio)

getenv_path(PORTAUDIO_HOME)

set(PortAudio_PREFIX_PATH ${PortAudio_HOME} ${ENV_PortAudio_HOME})
create_search_paths(PortAudio)

clear_if_changed(PortAudio_PREFIX_PATH
	PortAudio_LIBRARY_FWK
	PortAudio_LIBRARY_REL
	PortAudio_LIBRARY_DBG
	PortAudio_INCLUDE_DIR
)

set(PortAudio_LIBRARY_NAMES portaudio portaudioLib PortAudio PortAudioLib)
get_debug_names(PortAudio_LIBRARY_NAMES)

findpkg_framework(PortAudio)

find_path(PortAudio_INCLUDE_DIR NAMES portaudio.h HINTS ${PortAudio_INC_SEARCH_PATH} ${PortAudio_PKGC_INCLUDE_DIRS})

find_library(PortAudio_LIBRARY_REL NAMES ${PortAudio_LIBRARY_NAMES} HINTS ${PortAudio_LIB_SEARCH_PATH} ${PortAudio_PKGC_LIBRARY_DIRS} PATH_SUFFIXES "" Release RelWithDebInfo MinSizeRel)
find_library(PortAudio_LIBRARY_DBG NAMES ${PortAudio_LIBRARY_NAMES_DBG} HINTS ${PortAudio_LIB_SEARCH_PATH} ${PortAudio_PKGC_LIBRARY_DIRS} PATH_SUFFIXES "" Debug)

make_library_set(PortAudio_LIBRARY)

findpkg_finish(PortAudio)

endif(NOT DEFINED PORTAUDIO_MODULE_LOADED)