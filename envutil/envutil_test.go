package envutil_test

import (
	"reflect"
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/cmattoon/x/envutil"
)

func TestFromEnviron(t *testing.T) {
	for _, tc := range []struct {
		e []string
		m map[string]string
	}{
		{e: []string{}, m: map[string]string{}},
		{e: []string{""}, m: map[string]string{}},
		{e: []string{"FOO"}, m: map[string]string{}},
		{e: []string{"FOO="}, m: map[string]string{"FOO": ""}},
		{e: []string{"FOO=bar", "BAR=baz=bat", "BAZ=something=\"something\""},
			m: map[string]string{
				"FOO": "bar",
				"BAR": "baz=bat",
				"BAZ": "something=\"something\"",
			},
		},
	} {
		eq := reflect.DeepEqual(envutil.FromEnviron(tc.e), tc.m)
		assert.True(t, eq, "Expected maps to be the same")
	}
}
