#!/bin/sh -e
# ESET PROTECT
# Copyright (c) 1992-2023 ESET, spol. s r.o. All Rights Reserved

cleanup_file="$(mktemp -q)"
finalize()
{
  set +e
  if test -f "$cleanup_file"
  then
    while read f
    do
      rm -f "$f"
    done < "$cleanup_file"
    rm -f "$cleanup_file"
  fi
}

trap 'finalize' HUP INT QUIT TERM EXIT

eraa_server_hostname="protect.local"
eraa_server_port="2222"
eraa_server_company_name=""
eraa_peer_cert_b64="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"
eraa_peer_cert_pwd=""
eraa_ca_cert_b64="MIIERTCCAq2gAwIBAgISATErh3F88kyHrwNKjHEygdEBMA0GCSqGSIb3DQEBCwUAMDYxJzAlBgNVBAMMHlNlcnZlciBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTELMAkGA1UEBhMCVVMwHhcNMjYwNTE2MjIwMDAwWhcNMzYwNTE3MjIwMDAwWjA2MScwJQYDVQQDDB5TZXJ2ZXIgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxCzAJBgNVBAYTAlVTMIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAsqBz+KZJsWQdTm5aw7kqV3WfV0DTp4Dz8dAMZTqhGXQ1iiFPO7IhRimma/7KrqU5S8lprW6qiJ8K9I6KRmxZMgqFaQlI8dvX8De8FP6YPFWJEELtlWI4nZtnczWslVN4AR4gZrovUwoCC8I7m2rK3xttCMu4UCnkn/kPH7y+aC2sD9AsK14yHFR06bQk9FxQrZNo83nHW1baRgM7lPupmnlXEr70P1nWvbKY39AKsaJ3dlvzjP4ODAs3GNOta+32ayNTzYAzVFI7M1e9GrkEghQP7RtWd6ki9vJRf66DTRti/J39d8FxSdcjIEABJ7e68JgHjYmEJSg0ZrM8l9XDDy/ts87P2f8SKQEmrSMeJqPfFfU/2pBcRRlZvbcHyez5z9EQi5qPWdeJly9WyslfvjMuFO+X/qxs0ZRn0AMJnccg+4qSQX0US8RIqjjP98mgCEyPd3UmrZgtw6juuRVd8cBBmpJXmqQECVX93EI6CMXhatLzbHLKetBfYzKYXX5PAgMBAAGjTTBLMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSWjm9DbjASmayHjyM4NXTiMVExqjAJBgNVHSMEAjAAMA0GCSqGSIb3DQEBCwUAA4IBgQBB+NS8QquazXzppQ8qvisVvUVodJCYO0/vLqW1QT2vdywBc+TaSiTJ6AxhzHEe3AkDj2BbgN8A0iPqK85JUJ9sssLhURrIUqXuNcCunYXZFsJ7L3sEaUn8iRLeWtN9sROdutvoJBSNG/NzQlD0WI64sIsD4JXeQ1BkeQ833YLARZltTig5BCr97R7Zcix4/KB8fPLZ6vx9qcRqQFmZp2Tqv9rXIR8qO0YUvWNq1GWavWLgfdNjx3s/JhzTMo0Q1t1JOfsVr3IxKsDivsVuSVTsPCmUlllYgFXzFAsZ+Xd9swTRLLX3eECYKrXgpGFt0G/moTNAMAh4IgXiKsmIRjYiYGvnJD8MBjcuPYmbZ8aSKx03mdHyaRxx8eMPLPQX50jtWZ1q0x3szs+cYXOA08uulgBzPemn5YTgd1EJP3/S/xpGg4JGU6waw/NEgRqGXZcbKgyiLYbeRtQKodAEjiHFokL8bDqr65lzzqYPOCWG1/3++UelicnbZM0rEf+QTyI="
eraa_product_uuid=""
eraa_initial_sg_token=""
eraa_policy_data=""

arch=$(uname -m)
eraa_installer_url="http://repository.eset.com/v1/com/eset/apps/business/era/agent/v13/13.0.1400.0/agent_linux_i386.sh"
eraa_installer_checksum="76ffb94187dc80033b2f521355c89062a2d00c2f39b259a15613ee65c2aded08"

if $(echo "$arch" | grep -E "^(x86_64|amd64)$" 2>&1 > /dev/null)
then
    eraa_installer_url="http://repository.eset.com/v1/com/eset/apps/business/era/agent/v13/13.0.1400.0/agent_linux_x86_64.sh"
    eraa_installer_checksum="eea62edddce6f5b25bf2824951c8a0feb9d62847bf4ead6ee2a5ddcb92a45b02"
fi

echo "ESET Management Agent live installer script. Copyright © 1992-2023 ESET, spol. s r.o. - All rights reserved."

if test ! -z $eraa_server_company_name
then
  echo " * CompanyName: $eraa_server_company_name"
fi
echo " * Hostname: $eraa_server_hostname"
echo " * Port: $eraa_server_port"
echo " * Installer: $eraa_installer_url"
echo

if test -z $eraa_installer_url
then
  echo "No installer available for '$arch' arhitecture."
  exit 1
fi

local_cert_path="$(mktemp -q -u)"
echo $eraa_peer_cert_b64 | base64 -d > "$local_cert_path" && echo "$local_cert_path" >> "$cleanup_file"

if test -n "$eraa_ca_cert_b64"
then
  local_ca_path="$(mktemp -q -u)"
  echo $eraa_ca_cert_b64 | base64 -d > "$local_ca_path" && echo "$local_ca_path" >> "$cleanup_file"
fi


eraa_http_proxy_value=""

local_installer="$(dirname $0)"/"$(basename $eraa_installer_url)"

if $(echo "$eraa_installer_checksum  $local_installer" | sha256sum -c 2> /dev/null > /dev/null)
then
    echo "Verified local installer was found: '$local_installer'"
else
    local_installer="$(mktemp -q -u)"

    echo "Downloading ESET Management Agent installer..."

    if test -n "$eraa_http_proxy_value"
    then
      export use_proxy=yes
      export http_proxy="$eraa_http_proxy_value"
      (wget --connect-timeout 300 --no-check-certificate -O "$local_installer" "$eraa_installer_url" || wget --connect-timeout 300 --no-proxy --no-check-certificate -O "$local_installer" "$eraa_installer_url" || curl --fail --connect-timeout 300 -k "$eraa_installer_url" > "$local_installer") && echo "$local_installer" >> "$cleanup_file"
    else
      (wget --connect-timeout 300 --no-check-certificate -O "$local_installer" "$eraa_installer_url" || curl --fail --connect-timeout 300 -k "$eraa_installer_url" > "$local_installer") && echo "$local_installer" >> "$cleanup_file"
    fi

    if test ! -s "$local_installer"
    then
       echo "Failed to download installer file"
       exit 2
    fi

    echo -n "Checking integrity of installer script " && echo "$eraa_installer_checksum  $local_installer" | sha256sum -c
fi

chmod +x "$local_installer"

command -v sudo > /dev/null && usesudo="sudo -E" || usesudo=""

export _ERAAGENT_PEER_CERT_PASSWORD="$eraa_peer_cert_pwd"

echo
echo Running installer script $local_installer
echo

$usesudo /bin/sh "$local_installer"\
   --skip-license \
   --hostname "$eraa_server_hostname"\
   --port "$eraa_server_port"\
   --cert-path "$local_cert_path"\
   --cert-password "env:_ERAAGENT_PEER_CERT_PASSWORD"\
   --cert-password-is-base64\
   --initial-static-group "$eraa_initial_sg_token"\
   \
   --enable-imp-program\
   $(test -n "$local_ca_path" && echo --cert-auth-path "$local_ca_path")\
   $(test -n "$eraa_product_uuid" && echo --product-guid "$eraa_product_uuid")\
   $(test -n "$eraa_policy_data" && echo --custom-policy "$eraa_policy_data")
