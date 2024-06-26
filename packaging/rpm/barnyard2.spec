# TODO
################################################################
# rpmbuild Package Options
# ========================
#       --with mysql
#               Builds a binary/package with support for MySQL.
#
#       --with postgresql
#               Builds a binary/package with support for PostgreSQL.
#
#       --with oracle
#               Builds a binary/package with support for Oracle.
#
#       --with libpcap1
#               Uses Vincent Cojot's libpcap1-devel rpm instead of libpcap-devel
#
# See pg 399 of _Red_Hat_RPM_Guide_ for rpmbuild --with and --without options.
################################################################

%global debug_package %{nil}

%define realname barnyard2
%define release 1

Summary: Snort Log Backend 
Name: %{realname}
Version: %{__version}
Source0: %{realname}-%{version}.tar.gz
Release: %{release}%{?dist}
License: GPL
Group: Applications/Internet
Url: http://www.github.com/firnsy/barnyard2

BuildRequires: librd-devel librdkafka-devel librb-http-devel libpcap-devel GeoIP-devel rb_macs_vendors gcc
Requires: librd0 librdkafka librb-http0 libpcap curl-devel GeoIP-devel GeoIP GeoIP-GeoLite-data-extra rb_macs_vendors

%description
barnyard2 version 1.14

%prep
%setup -qn %{realname}-%{version}

%build
./configure --prefix=/ --sbindir=/usr/sbin --exec-prefix=/ \
            --enable-ipv6 --enable-geo-ip --enable-kafka \
            --enable-rb-macs-vendors --enable-rb-http \
            --with-rdkafka-includes=/usr/include \
            --with-rdkafka-libraries=/lib64 \
            --with-macs-vendors-includes=/usr/include \
            --with-macs-vendors-libraries=/lib \
            --enable-extradata
make

%install
%makeinstall 
%{__mkdir_p} -p $RPM_BUILD_ROOT/usr/lib/systemd/system/
%{__install} -d -p $RPM_BUILD_ROOT%{_sysconfdir}/{sysconfig,rc.d/init.d,snort} 
%{__install} -m 644 packaging/rpm/barnyard2.config $RPM_BUILD_ROOT%{_sysconfdir}/sysconfig/barnyard2
%{__install} -m 755 packaging/rpm/barnyard2 $RPM_BUILD_ROOT%{_sysconfdir}/rc.d/init.d/barnyard2
%{__install} -p -m 0644 packaging/rpm/barnyard2.service $RPM_BUILD_ROOT/usr/lib/systemd/system/barnyard2.service
%{__rm} $RPM_BUILD_ROOT%{_sysconfdir}/barnyard2.conf


%clean
if [ -d $RPM_BUILD_ROOT ] && [ "$RPM_BUILD_ROOT" != "/"  ] ; then
   rm -rf $RPM_BUILD_ROOT
fi

%files
%defattr(-,root,root)
%doc LICENSE doc/INSTALL doc/README.*
%attr(755,root,root)       %{_bindir}/barnyard2
%attr(755,root,root) %config %{_sysconfdir}/rc.d/init.d/barnyard2
%attr(644,root,root) %config %{_sysconfdir}/sysconfig/barnyard2
%attr(644,root,root) /usr/lib/systemd/system/barnyard2.service 

%changelog
* Mon Nov 06 2023 David Vanhoucke <dvanhoucke@redborder.com> - 2.14-1
- Created barnyard rpm

