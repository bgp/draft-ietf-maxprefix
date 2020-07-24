# Todo

## Feedback from Sue Hares 3 september 2019

* ~~Update 4271 (but not 4486, since 4486 links to 4271)~~
* ~~Recycle cease code 1 for both pre and post inbound policy~~ (Not going to do this)
* ~~New cease notification subcode for outbound~~

## RFC4271

* Page 45 / event 8 AutomaticStop, expand
* Page 71 / 

## Permutations in new world

* ~~inbound pre-policy limit, keep session open, don't accept new~~
* ~~inbound pre-policy limit, close session~~
* ~~inbound post-policy limit, keep session open, don't accept new~~
* ~~inbound post-policy limit, close session~~
* ~~outbound post-policy limit, keep session open, don't send~~
* ~~outbound post-policy limit, close session~~

## Feedback from IETF 104

* ~~Talk with John & Susan from IDR whether the document belongs there or in GROW~~
* ~~Discuss what things can be done when outbound threshold is met (igor/john)~~
* ~~Make it very clear that the outbound limit is post-policy (Ruediger)~~
* Jared Mauch wants to help (@stucchimax to send an email 24/7/2020)

## Feedback from IETF 105

* Make it clear that this is a *hard* cease, reference rfc8538, thank jacob + robert

## Document structure

1. Introduction:
  2. ~~probleem stelling~~
  3. ~~oplossing~~
1. Control theory:
  * Valves
  * Fail closed
1. Prioritise security over convenience

## Inbound structure

* Inbound maximum prefix limits
  * type A: pre-policy
     * Describe placement in conceptual model: Adj-RIB-In
     * Protect against full table leaks
         * RIB exhaustion
         * 'soft reconfiguration inbound' needed to do pre-policy
  * type B: post-policy
     * Describe placement in conceptual model: after PIB in Adj-RIB-In -> Loc-RIB
     * Protect against FIB exhaution

## Outbound structure

* Outbound maximum prefix limits
   * type C: (implicitly) post-policy
       * Describe placement in conceptual model: Adj-RIB-Out
       * Dead man's switch
       * Protects others against your own misconfigurations

* Considerations when using Multi Protocol BGP-4:
    * Best current practice is to do IPv4 over IPv4, IPv6 over IPv6
    * Isolation between AFIs / fate sharing between AFIs on single session
    * Implementors should be able to specify per AFI limits


## Known implementations

None yet.

## IANA

* Update https://www.iana.org/assignments/bgp-parameters/bgp-parameters.xhtml#bgp-parameters-8 that '1 is used for inbound'
* Request new cease notification for outbound limit reached

## References:

```
    RFC 4271, 8.2.2.  Finite State Machine:
        "One reason for an AutomaticStop event is: A BGP receives an UPDATE
        messages with a number of prefixes for a given peer such that the
        total prefixes received exceeds the maximum number of prefixes
        configured.  The local system automatically disconnects the peer."

    RFC 4486 "Subcodes for BGP Cease Notification Message"
        "If a BGP speaker decides to terminate its peering with a neighbor
        because the number of address prefixes received from the neighbor
        exceeds a locally configured upper bound (as described in [BGP-4]),
        then the speaker MUST send to the neighbor a NOTIFICATION message
        with the Error Code Cease and the Error Subcode "Maximum Number of
        Prefixes Reached".  The message MAY optionally include the Address
        Family information [BGP-MP] and the upper bound in the "Data" field,
        as shown in Figure 1, where the meaning and use of the <AFI, SAFI>
        tuple is the same as defined in [BGP-MP], Section 7."

   RFC 7908 - route leak definitions
```