cmake_minimum_required(VERSION 2.8.11)

project(images-to-pdf)

install(FILES LICENSE DESTINATION /usr/share/doc/images-to-pdf/ )
install(FILES README.md DESTINATION /usr/share/doc/images-to-pdf/ )
install(FILES src/images_to_pdf.sh DESTINATION /usr/bin/ PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
set(CPACK_PACKAGE_NAME "images-to-pdf")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "script to convert multiple jpegs into pdf")
set(CPACK_PACKAGE_VERSION "1.0.3")
set(SYSTEM_ARCH "all")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "imagemagick-6-common")
set(CPACK_GENERATOR "DEB")
set(PACKAGE_OS "linux")
set(CPACK_SYSTEM_NAME "${PACKAGE_OS}-amd64")
set(SYSTEM_ARCH "amd64")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Johannes Maier <maier_jo@gmx.de>")
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_CURRENT_SOURCE_DIR}/postinst;${CMAKE_CURRENT_SOURCE_DIR}/prerm")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-${CPACK_DEBIAN_REVISON}${CPACK_SYSTEM_NAME}")

include(CPack)


