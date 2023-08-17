#! /bin/bash
#Enters frontend
cd frontend/
#Runs tests in frontend
go test -v

#Enters backend
cd ../backend/
#Runs tests in backend
go test -v
