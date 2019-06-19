package cache

import (
	"fmt"
	"github.com/go-redis/redis"
	"github.com/spf13/viper"
	"time"
	"zeus/pkg/api/log"
)

// Redis cache implement
type Redis struct {
	client *redis.Client
}

// Setup connection
func (r Redis) Connect(){
	r.client = redis.NewClient(&redis.Options{
		Addr: viper.GetString("redis.host"),
		Password:viper.GetString("redis.auth"),
		DB:0,
		MaxConnAge:20,
		MinIdleConns:3,
	})
	_,err := r.client.Ping().Result()
	if err != nil {
		log.Fatal(fmt.Sprintf("Could not connected to redis : %s",err.Error()))
	}
	log.Info("Successfully connected to redis")
}

// Get from key
func (r Redis) Get(key string) (string,error) {
	return r.client.Get(key).Result()
}

// Set value with key and expire time
func (r Redis) Set(key string , val string ,expire int ) error {
	return r.client.Set(key,val,time.Duration(expire)).Err()
}