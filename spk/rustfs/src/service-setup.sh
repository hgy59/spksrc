
INST_ETC="/var/packages/${SYNOPKG_PKGNAME}/etc"
INST_VARIABLES="${INST_ETC}/installer-variables"
ENV_VARIABLES="${SYNOPKG_PKGVAR}/environment-variables"

API_PORT=9004

SVC_BACKGROUND=y
SVC_WRITE_PID=y

export RUSTFS_OBS_LOG_DIRECTORY=$(LOG_FILE)

service_postinst ()
{
   echo "# values from wizard:"                             >> ${INST_VARIABLES}
   echo RUSTFS_ACCESS_KEY="${wizard_access_key}"            >> ${INST_VARIABLES}
   echo RUSTFS_SECRET_KEY="${wizard_secret_key}"            >> ${INST_VARIABLES}
   echo "# default values:"                                 >> ${INST_VARIABLES}
   echo RUSTFS_ADDRESS=":${API_PORT}"                       >> ${INST_VARIABLES}
   echo RUSTFS_CONSOLE_ADDRESS=":${SERVICE_PORT}"           >> ${INST_VARIABLES}
   echo RUSTFS_CHECK_UPDATE=false                           >> ${INST_VARIABLES}
   echo RUSTFS_OBS_LOG_DIRECTORY="${SYNOPKG_PKGVAR}/log"    >> ${INST_VARIABLES}
}

# function to read and export variables from a text file
# empty lines and lines starting with # are ignored
export_variables_from_file ()
{
   if [ -n "$1" -a -r "$1" ]; then
      while read -r _line; do
        if [ "$(echo ${_line} | grep -v ^[/s]*#)" != "" ]; then
           _key="$(echo ${_line} | cut --fields=1 --delimiter==)"
           _value="$(echo ${_line} | cut --fields=2- --delimiter==)"
           export "${_key}=${_value}"
        fi
      done < "$1"
   fi
}


service_prestart ()
{
   # Reload wizard variables stored by postinst
   export_variables_from_file "${INST_VARIABLES}"

   # Load custom variables
   export_variables_from_file "${ENV_VARIABLES}"

   SERVICE_COMMAND="${SYNOPKG_PKGDEST}/bin/rustfs server ${SHARE_PATH}"
}
