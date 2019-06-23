package cache

var adapter Adapter

type Adapter interface {
	Connect()
	Get(key string) (string, error)
	Set(key string, val string, expire int) error
}

type Cache struct {
}

func SetUp() {
	adapter = Redis{}
	adapter.Connect()
}
func (c Cache) Set(key, val string, expire int) error {
	return adapter.Set(key, val, expire)
}
func (c Cache) Get(key string) (string, error) {
	return adapter.Get(key)
}
