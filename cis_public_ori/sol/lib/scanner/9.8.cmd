if [ "`echo $PATH | grep :: `" != "" ]; then
  echo "Empty Directory in PATH (::)"
fi

if [ "`echo $PATH | grep :$`" != "" ]; then
  echo "Trailing : in PATH"
fi