ENABLE_TESTING()
INCLUDE(AddCxxtest)

IF (WIN32)
    ADD_DEFINITIONS(-D_CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES
                    -D_CRT_SECURE_NO_WARNINGS)
ENDIF (WIN32)

ADD_DEFINITIONS(-DPROJECT_SOURCE_DIR="${CMAKE_SOURCE_DIR}"
                -DPROJECT_BINARY_DIR="${CMAKE_BINARY_DIR}")

# All tests should load the atomspace scm from the build dir, unless the scm
# file is specific to the test (this variable is used by ADD_CXXTEST)
SET(GUILE_LOAD_PATH "${PROJECT_BINARY_DIR}/opencog/scm")

# The atom_types.h file is written to the build directory
INCLUDE_DIRECTORIES(${CMAKE_BINARY_DIR})

# Perform tests in component-dependency order, as much as possible.
IF (CXXTEST_FOUND)

	IF (HAVE_ATOMSPACE)
		ADD_SUBDIRECTORY (neighbors)

		# Persistence is for saving/restoring atomspace to disk.
		ADD_SUBDIRECTORY (persist)

		ADD_SUBDIRECTORY (nlp)

		IF (HAVE_OPENPSI)
			ADD_SUBDIRECTORY (openpsi)
		ENDIF (HAVE_OPENPSI)

	ENDIF (HAVE_ATOMSPACE)

	IF (HAVE_CYTHON AND HAVE_NOSETESTS)
		ADD_SUBDIRECTORY (cython)
		ADD_SUBDIRECTORY (python)
	ENDIF (HAVE_CYTHON AND HAVE_NOSETESTS)

ENDIF (CXXTEST_FOUND)

IF (HAVE_GHOST)
	ADD_SUBDIRECTORY(ghost)
ENDIF(HAVE_GHOST)
