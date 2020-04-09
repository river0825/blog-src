---
title: AWS course - create billing alarm & s3 basic
tags: []
categories: aws
date: 2020-04-08 19:30:46
---




## create billing alarm 

https://www.udemy.com/course/aws-certified-solutions-architect-associate/learn/lecture/13886250#overview

1. Using cloud watch to create alarm


## S3

Files are stored in Buckets

1. The name have to be uniq globally

2 if upload is suecess, http 200 code if the upload is success

### S3 is object base, Think of Objects just as a file

- Key (The name of the object)
- Value
- Version ID (i)
- Metadata (Data about data you are storing)
- Subresources:
    Access Control
    Torrent

### How does data consistency ?
Read after write consistency for PUTS of new Objects
- you can read a object immediatly after you put the file

Eventual Consistency fro overwrite PUTS and DELETES
- update or delete a file will Eventual Consistency

### S3 Standard
99.99% availability
99.999999999% durability,
stored redundantly across multiple devices in multiple facilities, and is designed to sustain the loss of 2 facilities concurrently.

### S3 - IA (Infrequently Accessed):
For data that is accessed less frequently, but requires rapid access when needed. Lower fee than S3 but you are charged a retrival fee.

### S3 One Zone - IA (Infrequently Accessed):

### S3 - Intelligent Tiering

### S3 Glacier - data archiving 
super cheap
retriveal time is about minutes to 12 hours

### S3 Glacier - data archiving 
super cheap
retriveal time is about 12 hours

### S3 Charges
- Storage
- request 
- Storage Management Pricing
- Data Transfer Pricing
- Transfer Acceleration
    - transfer S3 data to edege locations
- Cross Region Replication Pricing
    - ex us-vigin-1 transfer data to sydney

### Tips
- Object-based
- 0 bytes to 5TB
- unlimited storage
- files are stored in buckets
- s3 ard universal namespace. That is, names must be unique globally
- `Not suitable` to install an operating system or database on.
- Successfull uploads will genereate a HTTP 200 status code
- You can turn MFA delete

### The Key Fundamentals of S3 are;
Key
value
version id
metadata
subresource
    Access control lists
    torrent

