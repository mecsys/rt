# This file was generated by running "update-rt-siteconfig-3.8".
#
# While local modifications will not be overwritten without permission,
# it is recommended the they are instead placed in 
# /etc/request-tracker3.8/RT_SiteConfig.d
#
# Note that modifications to the RT_SiteConfig.d directory won't 
# take effect until the update command mentioned above is run again.

# start /etc/request-tracker3.8/RT_SiteConfig.d/40-timezone
# dynamically find out the current timezone
my $zone = "UTC";
$zone=`/bin/cat /etc/timezone`
    if -f "/etc/timezone";
chomp $zone;
Set($Timezone, $zone);
# end   /etc/request-tracker3.8/RT_SiteConfig.d/40-timezone
# start /etc/request-tracker3.8/RT_SiteConfig.d/50-debconf
# THE BASICS:

Set($rtname, 'Motiva Contact Center');
#Set($Organization, 'tornado.localdomain');
Set($Organization, '10.100.4.124');

Set($CorrespondAddress , 'rt@motiva.com.br');
Set($CommentAddress , 'rt-comment@motiva.com.br');

Set($MaxAttachmentSize , 10000000);
Set($FriendlyFromLineFormat, "\"%s\" <%s>");

#Set($SendmailPath, "/usr/lib/sendmail");

# THE WEBSERVER:

Set($WebPath , "/rt");
Set($WebBaseURL , "http://10.100.4.124");

# end   /etc/request-tracker3.8/RT_SiteConfig.d/50-debconf
# start /etc/request-tracker3.8/RT_SiteConfig.d/51-dbconfig-common
# THE DATABASE:
# generated by dbconfig-common

# map from dbconfig-common database types to their names as known by RT
my %typemap = (
    mysql   => 'mysql',
    pgsql   => 'Pg',
    sqlite3 => 'SQLite',
);
    
Set($DatabaseType, $typemap{mysql} || "UNKNOWN");

Set($DatabaseHost, 'localhost');
Set($DatabasePort, '');

Set($DatabaseUser , 'rtuser');
Set($DatabasePassword , '666777');

# SQLite needs a special case, since $DatabaseName must be a full pathname
my $dbc_dbname = 'rtdb'; if ( "mysql" eq "sqlite3" ) { Set ($DatabaseName, '' . '/' . $dbc_dbname); } else { Set ($DatabaseName, $dbc_dbname); }
# end   /etc/request-tracker3.8/RT_SiteConfig.d/51-dbconfig-common
1;

# {{{ Logging

# Logging.  The default is to log anything except debugging
# information to syslog.  Check the Log::Dispatch POD for
# information about how to get things by syslog, mail or anything
# else, get debugging info in the log, etc.

#  It might generally make
# sense to send error and higher by email to some administrator.
# If you do this, be careful that this email isn't sent to this RT instance.

# the minimum level error that will be logged to the specific device.
# levels from lowest to highest:
#  debug info notice warning error critical alert emergency

#  Mail loops will generate a critical log message.
Set($LogToSyslog    , undef);
Set($LogToScreen    , undef);
Set($LogToFile      , 'debug');
Set($LogDir, '/var/log/request-tracker3.8');
Set($LogToFileNamed , "rt.log");    #log to rt.log

Set($LogoURL, $WebImagesURL . "logo_motiva_azul.png");
Set($LogoImageURL, $WebPath . '/NoAuth/Images/logo_motiva_azul.png');
Set($LogoLinkURL, 'http://10.100.4.124/');
Set($LogoAltText, "Motiva Contact Center");
Set($LogoImageWidth, 300);
Set($LogoImageHeight, 46);

# Fixed para RT localizar arquivos dos plugins
Set(@Plugins, qw( 
RT::Extension::SLA
RT::Condition::SLA_RequireDefault
) ); 