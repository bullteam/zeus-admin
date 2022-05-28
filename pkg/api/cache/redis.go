package cache

import (
	"context"
	"fmt"
	"github.com/go-redis/redis/v8"
	"github.com/spf13/viper"
	"time"
	"zeus/pkg/api/log"
)

// Redis cache implement
type Redis struct {
	client *redis.Client
}

// Setup connection
func (r *Redis) Connect() {
	ctx := context.TODO()
	r.client = redis.NewClient(&redis.Options{
		Addr:         viper.GetString("redis.host"),
		Password:     viper.GetString("redis.auth"),
		DB:           viper.GetInt("redis.db"),
		PoolSize:     viper.GetInt("redis.pool.max"),
		MinIdleConns: viper.GetInt("redis.pool.min"),
	})
	_, err := r.client.Ping(ctx).Result()
	if err != nil {
		log.Fatal(fmt.Sprintf("Could not connected to redis : %s", err.Error()))
	}
	log.Info("Successfully connected to redis")
}

// Get from key
func (r *Redis) Get(key string) (string, error) {
	ctx := context.TODO()
	return r.client.Get(ctx, key).Result()
}

// Set value with key and expire time
func (r *Redis) Set(key string, val string, expire int) error {
	ctx := context.TODO()
	return r.client.Set(ctx, key, val, time.Duration(expire)).Err()
}

// Del delete key in redis
func (r *Redis) Del(key string) error {
	ctx := context.TODO()
	return r.client.Del(ctx, key).Err()
}

// HashGet from key
func (r *Redis) HashGet(hk, key string) (string, error) {
	ctx := context.TODO()
	return r.client.HGet(ctx, hk, key).Result()
}

// HashDel delete key in specify redis's hashtable
func (r *Redis) HashDel(hk, key string) error {
	ctx := context.TODO()
	return r.client.HDel(ctx, hk, key).Err()
}

// Increase
func (r *Redis) Increase(key string) error {
	ctx := context.TODO()
	return r.client.Incr(ctx, key).Err()
}

// Set ttl
func (r *Redis) Expire(key string, dur time.Duration) error {
	ctx := context.TODO()
	return r.client.Expire(ctx, key, dur).Err()
}
