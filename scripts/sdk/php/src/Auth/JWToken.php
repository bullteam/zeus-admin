<?php
namespace ZeusClient\Auth;
 /*  @author BL Lohar - (bheru.l@kwalityhost.com) */

 /* Reference

 * Implements JWT encoding and decoding as per http://tools.ietf.org/html/draft-ietf-oauth-json-web-token-06
 * Encoding algorithm based on http://code.google.com/p/google-api-php-client
 * Decoding algorithm based on https://github.com/luciferous/jwt.git
 */

class JWToken
{

    private static function verify($signature, $input, $secret, $algo)
    {
        switch ($algo) {
            case'HS256':
            case'HS384':
            case'HS512':
                return JWToken::sign($input, $secret, $algo) === $signature;

            case 'RS256':
                return (boolean) openssl_verify($input, $signature, $secret, OPENSSL_ALGO_SHA256);

            case 'RS384':
                return (boolean) openssl_verify($input, $signature, $secret, OPENSSL_ALGO_SHA384);

            case 'RS512':
                return (boolean) openssl_verify($input, $signature, $secret, OPENSSL_ALGO_SHA512);

            default:
                throw new \Exception("Unsupported or invalid signing algorithm.");
        }
    }

    private static function sign($input, $secret, $algo)
    {
        switch ($algo) {

            case 'HS256':
                return hash_hmac('sha256', $input, $secret, true);

            case 'HS384':
                return hash_hmac('sha384', $input, $secret, true);

            case 'HS512':
                return hash_hmac('sha512', $input, $secret, true);

            case 'RS256':
                return JWToken::generateRSA($input, $secret, OPENSSL_ALGO_SHA256);
            case 'RS384':
                return JWToken::generateRSA($input, $secret, OPENSSL_ALGO_SHA384);
            case 'RS512':
                return JWToken::generateRSA($input, $secret, OPENSSL_ALGO_SHA512);

            default:
                throw new \Exception("Unsupported or invalid signing algorithm.");
        }
    }

    private static function generateRSA($input, $secret, $algo)
    {
        if (!openssl_sign($input, $signature, $secret, $algo)) {
            throw new \Exception("Unable to sign data.");
        }

        return $signature;
    }

    private static function urlSafeB64Encode($data)
    {
        $b64 = base64_encode($data);
        $b64 = str_replace(array('+', '/', '\r', '\n', '='),
                array('-', '_'),
                $b64);

        return $b64;
    }

    private static function urlSafeB64Decode($b64)
    {
        $b64 = str_replace(array('-', '_'),
                array('+', '/'),
                $b64);

        return base64_decode($b64);
    }

    public static function encode($payload, $secret, $algo = 'HS256')
    {
        $header = array('typ' => 'JWT', 'alg' => $algo);

        $segments = array(
            JWToken::urlsafeB64Encode(json_encode($header)),
            JWToken::urlsafeB64Encode(json_encode($payload))
        );

        $signing_input = implode('.', $segments);

        $signature = JWToken::sign($signing_input, $secret, $algo);
        $segments[] = JWToken::urlsafeB64Encode($signature);

        return implode('.', $segments);
    }

    public static function decode($jwt, $secret = null, $algo = null)
    {
        $tks = explode('.', $jwt);

        if (count($tks) != 3) {
            throw new \Exception('Wrong number of segments');
        }

        list($headb64, $payloadb64, $cryptob64) = $tks;

        if (null === ($header = json_decode(JWToken::urlsafeB64Decode($headb64)))) {
            throw new \Exception('Invalid segment encoding');
        }

        if (null === $payload = json_decode(JWToken::urlsafeB64Decode($payloadb64))) {
            throw new \Exception('Invalid segment encoding');
        }

        $sig = JWToken::urlsafeB64Decode($cryptob64);

        if (isset($secret)) {

            if (empty($header->alg)) {
                throw new DomainException('Empty algorithm');
            }

            if (!JWToken::verify($sig, "$headb64.$payloadb64", $secret, $algo)) {
                throw new UnexpectedValueException('Signature verification failed');
            }
        }

        return $payload;
    }
}