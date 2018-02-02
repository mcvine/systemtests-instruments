def _createDefaultMantidUserConfig(facility='SNS'):
    # create default Mantid user configuration for DEMO purpose.
    import os
    mantid_config_path = os.path.expanduser('~/.mantid/Mantid.user.properties')
    mantid_user_dir = os.path.dirname(mantid_config_path)
    if not os.path.exists(mantid_config_path):
        if not os.path.exists(mantid_user_dir):
            os.makedirs(mantid_user_dir)
        with open(mantid_config_path, 'wt') as of:
            of.write('default.facility=%s' % facility)
            of.write('MultiThreaded.MaxCores = 4')
    return
# this should be done before mantid is imported
_createDefaultMantidUserConfig()
