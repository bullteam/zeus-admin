package utils

import "reflect"

func StringSliceRemove(slice [][]string, i int) [][]string {
	copy(slice[i:], slice[i+1:])
	return slice[:len(slice)-1]
}

func IsNilObject(object interface{}) bool {
	if object == nil {
		return true
	}

	value := reflect.ValueOf(object)
	kind := value.Kind()
	if kind >= reflect.Chan && kind <= reflect.Slice && value.IsNil() {
		return true
	}

	return false
}
