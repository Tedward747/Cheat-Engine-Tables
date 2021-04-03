function aobScanRegion(SYMBOL, START, END, AOB)
  local CODE = [[aobScanRegion(%s, %s, %s, %s)
  registerSymbol(%s)]]

  if type(START) == 'number' then START = ('%X'):format(START) end
  if type(END) == 'number' then END = ('%X'):format(END) end
  CODE = CODE:format(SYMBOL, START, END, AOB, SYMBOL)

  if not autoAssemble(CODE) then return nil end
  return 1
end

print("aobScanRegion = decodeFunction('" .. encodeFunction(aobScanRegion) .. "') -- (SYMBOL, START, END, AOB)")

aobScanRegion = decodeFunction('c-n1^(q}8U5Ql%W-I5UPNiQnYT(gX2@98aXJ;[ITdflyC5t@+z4^dMTXYhs6H+;ZXdg.J0@PBzn4+QUIy1=D/D7jB$EaQ0lfpbka8G)4Y.,D96:0Tk2DuXAF(pqhT[hJn4;Hy=*5dHD*i3xGyK$p324.C,SQXvDvBNGe;PrX3!3[[YK6,9w%i}]22ePe#b4z.J[e1b;BirZK1OtI9{yZ!oh*pXLlr01R]X/G9]*7rY(mBy[Zn8^)g];]@ry3+KM4kim3tz2E_R+rPnI?L6]G.4c9^}trRRDU]gK%*') -- (SYMBOL, START, END, AOB)




function error_mr(ID)
  local mr = getAddressList().getMemoryRecordByID(ID)
  mr.setDescription("Disabled, can't find method: " .. mr.Description)
  mr.Type = 0
end

print("error_mr = decodeFunction('" .. encodeFunction(error_mr) .. "') -- (ID)")

error_mr = decodeFunction('c-oWpDNPJ!ketlRCB=/U!NS2(5ypT38s!d+3}WFK7Z5Wtu/](YHwFiWl!gWdcZUNE4M2WM0_R4w!vTha2N*RG84ohtWoTqv.:sV?*o]#$4XA:0sD[0/J,.I!C8a2{xY#GNxP)On$oEan%]d79N:=o$N@z=6bYbByPAzdsElw]VEGWs$(ts8u$t,Gx%1KSpQAkeAQ!i0S%gjqr$W1ND$WO6SVBtYl%NkNykSYvwHzNZ!008[?HGc') -- (ID)




function mono_findMethodByArgCount(namespace, classname, methodname, arguments)
  if namespace==nil or classname==nil or methodname==nil or arguments==nil then
    return nil,'invalid parameters'
  end

  local class=mono_findClass(namespace, classname)
  if class and (class~=0) then
    local methods = mono_class_enumMethods(class)
    for i=1, #methods do
      if methods[i].name == methodname then
        local count = 0
        local signature = mono_method_getSignature(methods[i].method)
        if #signature ~= 0 then
          for m in string.gmatch(signature, "[^,]+") do count=count+1 end
        end
        if count == arguments then
          return methods[i].method
        end
      end
    end
  end
  return 0
end

print("mono_findMethodByArgCount = decodeFunction('" .. encodeFunction(mono_findMethodByArgCount) .. "') -- (namespace, classname, methodname, arguments)")

mono_findMethodByArgCount = decodeFunction('c-n1H%Syvg5IvLJJP/^(3#rPj6e*@,fXjPRaHT83jc5oqtpSrtld8K.;Y@*GeuUyzL/PUXr9a[Hua*A*fng5k3{,sz]?]rE[4_dnl^w*H-?iG,Uu/40!n@?ZlLAY-ri4)Cia10CS.16AQh@)(NHSOupf%7UCbv^Z1),BcB}#O2S?_4R%96[GJ/;+l*hR*xCcG0^6c8S?%adSiO}%?3FdV5IE=/DR7Y)mHwmds/KgOUnn.qljN=7c,19-QAs_.7ZTG,5ll4kT;pq.HY?MM3D8kO-fJI+^;Ht2yqNBSA*5}u}9o)oY,va9GK;8xKygD8!Qc#w/5w4e3EZjyD^7g3)qW=vG@Q^n7}4C8E:9;m3YzmwN!+5G8uL*52j:}N7RadDXRvZxpiV(VOg!pn/6lJ$hwOQYiKT*4-lJ15)O_Kb}[cVV.') -- (namespace, classname, methodname, arguments)
