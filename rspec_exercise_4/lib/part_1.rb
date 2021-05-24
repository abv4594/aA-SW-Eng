def my_reject(arr,&prc)

    arr.select {|ele| !prc.call(ele)}

end

def my_one?(arr,&prc)

    arr.select! {|ele| prc.call(ele)}

    arr.length == 1

end


def hash_select(hsh,&prc)

    new_hsh = {}

    hsh.each {|k,v| new_hsh[k]=v if prc.call(k,v)}

    new_hsh

end

def xor_select(arr,prc1,prc2)


    arr.select do |ele| 
        cond1 = prc1.call(ele)
        cond2 = prc2.call(ele)
        (cond1||cond2) && !(cond1 && cond2)
    end


end

def proc_count(value, procs_array)
  
    procs_array.count {|proc| proc.call(value)}

end
