package cache

var adapter Adapter

type Adapter interface {
	Connect()
	Get(key string) (string, error)
	Set(key string, val string, expire int) error
	Del(key string) error
	HashGet(hk,key string) (string,error)
	HashDel(hk,key string) error
	Increase(key string) error
}

func SetUp() {
	adapter = &Redis{}
	adapter.Connect()
}

// Set val in cache
func Set(key, val string, expire int) error {
	return adapter.Set(key, val, expire)
}

// Get val in cache
func Get(key string) (string, error) {
	return adapter.Get(key)
}

// Del delete key in cache
func Del(key string) error {
	return adapter.Del(key)
}

// HashGet get val in hashtable cache
func HashGet(hk,key string) (string, error) {
	return adapter.HashGet(hk,key)
}

// HashDel delete one key:value pair in hashtable cache
func HashDel(hk,key string) error {
	return adapter.HashDel(hk,key)
}

// Increase value
func Increase(key string) error {
	return adapter.Increase(key)
}

