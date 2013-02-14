<?php $this->cache['en']['auth_shibboleth'] = array (
  'auth_shib_auth_method' => 'Authentication Method Name',
  'auth_shib_auth_method_description' => 'Provide a name for the Shibboleth authentication method that is familiar to your users. This could be the name of your Shibboleth federation, e.g. <tt>SWITCHaai Login</tt> or <tt>InCommon Login</tt> or similar.',
  'auth_shibboleth_contact_administrator' => 'In case you are not associated with the given organizations and you need access to a course on this server, please contact the',
  'auth_shibbolethdescription' => 'Using this method users are created and authenticated using <a href="http://shibboleth.internet2.edu/">Shibboleth</a>.<br />Be sure to read the <a href="../auth/shibboleth/README.txt">README</a> for Shibboleth on how to set up your Moodle with Shibboleth',
  'auth_shibboleth_errormsg' => 'Please select the organization you are member of!',
  'auth_shibboleth_login' => 'Shibboleth Login',
  'auth_shibboleth_login_long' => 'Login to Moodle via Shibboleth',
  'auth_shibboleth_manual_login' => 'Manual Login',
  'auth_shibboleth_select_member' => 'I\'m a member of ...',
  'auth_shibboleth_select_organization' => 'For authentication via Shibboleth, please select your organization from the drop down list:',
  'auth_shib_convert_data' => 'Data modification API',
  'auth_shib_convert_data_description' => 'You can use this API to further modify the data provided by Shibboleth. Read the <a href="../auth/shibboleth/README.txt">README</a> for further instructions.',
  'auth_shib_convert_data_warning' => 'The file does not exist or is not readable by the webserver process!',
  'auth_shib_changepasswordurl' => 'Password-change URL',
  'auth_shib_idp_list' => 'Identity Providers',
  'auth_shib_idp_list_description' => 'Provide a list of Identity Provider entityIDs to let the user choose from on the login page.<br />On each line there must be a comma-separated tuple for entityID of the IdP (see the Shibboleth metadata file) and Name of IdP as it shall be displayed in the drop-down list.<br />As an optional third parameter you can add the location of a Shibboleth session initiator that shall be used in case your Moodle installation is part of a multi federation setup.',
  'auth_shib_instructions' => 'Use the <a href="{$a}">Shibboleth login</a> to get access via Shibboleth, if your institution supports it.<br />Otherwise, use the normal login form shown here.',
  'auth_shib_instructions_help' => 'Here you should provide custom instructions for your users to explain Shibboleth.  It will be shown on the login page in the instructions section. The instructions must include a link to "<b>{$a}</b>" that users click when they want to log in.',
  'auth_shib_integrated_wayf' => 'Moodle WAYF Service',
  'auth_shib_integrated_wayf_description' => 'If you check this, Moodle will use its own WAYF service instead of the one configured for Shibboleth. Moodle will display a drop-down list on this alternative login page where the user has to select his Identity Provider.',
  'auth_shib_logout_return_url' => 'Alternative logout return URL',
  'auth_shib_logout_return_url_description' => 'Provide the URL that Shibboleth users shall be redirected to after logging out.<br />If left empty, users will be redirected to the location that moodle will redirect users to',
  'auth_shib_logout_url' => 'Shibboleth Service Provider logout handler URL',
  'auth_shib_logout_url_description' => 'Provide the URL to the Shibboleth Service Provider logout handler. This typically is <tt>/Shibboleth.sso/Logout</tt>',
  'auth_shib_no_organizations_warning' => 'If you want to use the integrated WAYF service, you must provide a coma-separated list of Identity Provider entityIDs, their names and optionally a session initiator.',
  'auth_shib_only' => 'Shibboleth only',
  'auth_shib_only_description' => 'Check this option if a Shibboleth authentication shall be enforced',
  'auth_shib_username_description' => 'Name of the webserver Shibboleth environment variable that shall be used as Moodle username',
  'shib_no_attributes_error' => 'You seem to be Shibboleth authenticated but Moodle didn\'t receive any user attributes. Please check that your Identity Provider releases the necessary attributes ({$a}) to the Service Provider Moodle is running on or inform the webmaster of this server.',
  'shib_not_all_attributes_error' => 'Moodle needs certain Shibboleth attributes which are not present in your case. The attributes are: {$a}<br />Please contact the webmaster of this server or your Identity Provider.',
  'shib_not_set_up_error' => 'Shibboleth authentication doesn\'t seem to be set up correctly because no Shibboleth environment variables are present for this page. Please consult the <a href="README.txt">README</a> for further instructions on how to set up Shibboleth authentication or contact the webmaster of this Moodle installation.',
  'pluginname' => 'Shibboleth',
);