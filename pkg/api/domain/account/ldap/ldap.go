package ldap

import (
	"crypto/tls"
	"errors"
	"fmt"

	ldap "gopkg.in/ldap.v3"
)

type LDAP_CONFIG struct {
	Addr       string   `json:"addr"`
	BaseDn     string   `json:"baseDn"`
	UserDn     string   `json:"userDn"`
	BindDn     string   `json:"bindDn`
	BindPass   string   `json:"bindPass"`
	AuthFilter string   `json:"authFilter"`
	Attributes []string `json:"attributes"`
	TLS        bool     `json:"tls"`
	StartTLS   bool     `json:"startTLS"`
}

var Conn *ldap.Conn

type LDAP_RESULT struct {
	DN         string              `json:"dn"`
	Attributes map[string][]string `json:"attributes"`
}

type Attribute struct {
	Type string
	Vals []string
}

func (lc *LDAP_CONFIG) Close() {
	if Conn != nil {
		Conn.Close()
		Conn = nil
	}
}

func (lc *LDAP_CONFIG) Connect() (err error) {
	if lc.TLS {
		Conn, err = ldap.DialTLS("tcp", lc.Addr, &tls.Config{InsecureSkipVerify: true})
	} else {
		Conn, err = ldap.Dial("tcp", lc.Addr)
	}
	if err != nil {
		return err
	}
	if !lc.TLS && lc.StartTLS {
		err = Conn.StartTLS(&tls.Config{InsecureSkipVerify: true})
		if err != nil {
			Conn.Close()
			return err
		}
	}

	err = Conn.Bind(lc.BindDn, lc.BindPass)
	if err != nil {
		Conn.Close()
		return err
	}
	return err
}

func (lc *LDAP_CONFIG) Auth(username, password string) (success bool, err error) {
	searchRequest := ldap.NewSearchRequest(
		lc.UserDn,
		ldap.ScopeWholeSubtree, ldap.NeverDerefAliases, 0, 0, false,
		fmt.Sprintf(lc.AuthFilter, username), // The filter to apply
		lc.Attributes,                        // A list attributes to retrieve
		nil,
	)
	sr, err := Conn.Search(searchRequest)
	if err != nil {
		return
	}
	if len(sr.Entries) == 0 {
		err = errors.New("Cannot find such user")
		return
	}
	if len(sr.Entries) > 1 {
		err = errors.New("Multi users in search")
		return
	}
	err = Conn.Bind(sr.Entries[0].DN, password)
	if err != nil {
		return
	}
	//Rebind as the search user for any further queries
	err = Conn.Bind(lc.BindDn, lc.BindPass)
	if err != nil {
		return
	}
	success = true
	return
}

func (lc *LDAP_CONFIG) Search_User(username string) (user LDAP_RESULT, err error) {
	searchRequest := ldap.NewSearchRequest(
		lc.UserDn,
		ldap.ScopeWholeSubtree, ldap.NeverDerefAliases, 0, 0, false,
		fmt.Sprintf(lc.AuthFilter, username), // The filter to apply
		lc.Attributes,                        // A list attributes to retrieve
		nil,
	)
	sr, err := Conn.Search(searchRequest)
	if err != nil {
		return
	}
	if len(sr.Entries) == 0 {
		err = errors.New("Cannot find such user")
		return
	}
	if len(sr.Entries) > 1 {
		err = errors.New("Multi users in search")
		return
	}

	attributes := make(map[string][]string)
	for _, attr := range sr.Entries[0].Attributes {
		attributes[attr.Name] = attr.Values
	}

	user.DN = sr.Entries[0].DN
	user.Attributes = attributes
	return
}

func (lc *LDAP_CONFIG) Search(SearchFilter string) (results []LDAP_RESULT, err error) {
	searchRequest := ldap.NewSearchRequest(
		lc.UserDn,
		ldap.ScopeWholeSubtree, ldap.NeverDerefAliases, 0, 0, false,
		SearchFilter,  // The filter to apply
		lc.Attributes, // A list attributes to retrieve
		nil,
	)
	sr, err := Conn.Search(searchRequest)
	if err != nil {
		return
	}
	if len(sr.Entries) == 0 {
		err = errors.New("Cannot find such dn")
		return
	}
	results = []LDAP_RESULT{}
	var result LDAP_RESULT
	for _, entry := range sr.Entries {
		attributes := make(map[string][]string)
		for _, attr := range entry.Attributes {
			attributes[attr.Name] = attr.Values
		}
		result.DN = entry.DN
		result.Attributes = attributes
		results = append(results, result)
	}
	return
}

func (lc *LDAP_CONFIG) Add(username, mail, uidNumber, gidNumber, password string) error {
	add := ldap.NewAddRequest(
		"cn="+username+","+lc.UserDn,
		nil,
	)
	add.Attribute("objectClass", []string{"top", "shadowAccount", "posixAccount", "person", "organizationalPerson", "inetOrgPerson"})
	add.Attribute("uid", []string{username})
	add.Attribute("cn", []string{username})
	add.Attribute("sn", []string{username})
	add.Attribute("mail", []string{mail})
	add.Attribute("uidNumber", []string{uidNumber})
	add.Attribute("gidNumber", []string{gidNumber})
	add.Attribute("loginShell", []string{"/bin/bash"})
	add.Attribute("homeDirectory", []string{"/home/" + username})
	add.Attribute("userPassword", []string{password})
	err := Conn.Add(add)
	return err
}
